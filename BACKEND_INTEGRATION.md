# Guide d'Intégration Backend PHP/MySQL avec Electron

## 📋 Vue d'ensemble

Ce guide explique comment intégrer un backend PHP/MySQL (WAMP) dans votre application Electron.

## 🏗️ Architecture

```
┌─────────────────┐         HTTP/HTTPS         ┌─────────────────┐
│  Electron App   │ ────────────────────────> │  Backend PHP    │
│  (React/TypeScript)│                         │  (WAMP/Apache)  │
└─────────────────┘                         └─────────────────┘
                                                    │
                                                    ▼
                                           ┌─────────────────┐
                                           │   MySQL Database│
                                           └─────────────────┘
```

## 🔧 Configuration

### 1. Configuration de l'API

Le service API est configuré dans `src/services/api.ts` et utilise les variables d'environnement :

```env
# .env
VITE_API_URL=http://localhost
```

### 2. Structure du Backend PHP recommandée

```
rma-backend/
├── api/
│   ├── auth/
│   │   ├── login.php
│   │   └── register.php
│   ├── claims/
│   │   ├── index.php      # GET /api/claims
│   │   ├── create.php     # POST /api/claims
│   │   └── [id].php       # GET/PUT/DELETE /api/claims/{id}
│   └── upload.php
├── config/
│   └── database.php
└── .htaccess
```

### 3. Exemple de fichier PHP (login.php)

```php
<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once '../config/database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';
    
    // Vérifier les credentials
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user && password_verify($password, $user['password'])) {
        // Générer un token JWT (utiliser une bibliothèque comme firebase/php-jwt)
        $token = generateJWT($user['id'], $user['email']);
        
        echo json_encode([
            'success' => true,
            'data' => [
                'token' => $token,
                'user' => [
                    'id' => $user['id'],
                    'name' => $user['name'],
                    'email' => $user['email'],
                    'role' => $user['role']
                ]
            ]
        ]);
    } else {
        http_response_code(401);
        echo json_encode([
            'success' => false,
            'error' => 'Email ou mot de passe incorrect'
        ]);
    }
}
?>
```

## 💻 Utilisation dans l'Application Electron

### 1. Connexion avec Backend

```typescript
import authService from '@/services/auth';

// Dans votre composant ClientLogin
const handleLogin = async (email: string, password: string) => {
  const response = await authService.login({ email, password });
  
  if (response.success) {
    // Rediriger vers le dashboard
    navigate('/client-dashboard');
  } else {
    // Afficher l'erreur
    toast({
      title: "Erreur de connexion",
      description: response.error,
      variant: "destructive"
    });
  }
};
```

### 2. Créer une Réclamation

```typescript
import claimsService from '@/services/claims';

const handleSubmitClaim = async (formData: any) => {
  // Upload des photos
  const photoUrls = [];
  for (const photo of formData.photos) {
    const url = await claimsService.uploadPhoto(claimId, photo);
    if (url) photoUrls.push(url);
  }
  
  // Créer la réclamation
  const claim = await claimsService.createClaim({
    type: formData.type,
    description: formData.description,
    location: formData.location,
    date: formData.date,
    photos: photoUrls
  });
  
  if (claim) {
    navigate('/client-dashboard');
  }
};
```

### 3. Vérifier si le Backend est Disponible

```typescript
import apiService from '@/services/api';

// Au démarrage de l'application
useEffect(() => {
  const checkBackend = async () => {
    const isAvailable = await apiService.checkBackendHealth();
    
    if (!isAvailable) {
      // Afficher un message d'avertissement
      toast({
        title: "Backend non disponible",
        description: "Veuillez démarrer WAMP pour utiliser toutes les fonctionnalités",
        variant: "warning"
      });
    }
  };
  
  checkBackend();
}, []);
```

## 🔒 Sécurité

### 1. CORS Configuration (.htaccess)

```apache
<IfModule mod_headers.c>
    Header set Access-Control-Allow-Origin "*"
    Header set Access-Control-Allow-Methods "GET, POST, PUT, DELETE, OPTIONS"
    Header set Access-Control-Allow-Headers "Content-Type, Authorization"
</IfModule>
```

### 2. Authentification JWT

- Utiliser des tokens JWT pour l'authentification
- Stocker le token dans `localStorage` (ou `electron-store` pour plus de sécurité)
- Envoyer le token dans le header `Authorization: Bearer {token}`

### 3. Validation des Données

- Valider toutes les données côté serveur PHP
- Utiliser des requêtes préparées pour éviter les injections SQL
- Sanitizer les uploads de fichiers

## 🚀 Déploiement

### Développement Local

1. **Démarrer WAMP** :
   - Apache doit être actif
   - MySQL doit être actif
   - Port 80 (ou 8080) disponible

2. **Configuration** :
   ```env
   VITE_API_URL=http://localhost
   ```

3. **Tester** :
   ```bash
   npm run dev
   ```

### Production

1. **Backend distant** :
   ```env
   VITE_API_URL=https://api.votre-domaine.com
   ```

2. **Build Electron** :
   ```bash
   npm run electron:build:win
   ```

## 📝 Checklist

- [ ] Backend PHP configuré et accessible
- [ ] Base de données MySQL créée
- [ ] API endpoints implémentés
- [ ] CORS configuré
- [ ] Authentification JWT implémentée
- [ ] Variables d'environnement configurées
- [ ] Services API créés dans Electron
- [ ] Gestion des erreurs implémentée
- [ ] Upload de fichiers configuré
- [ ] Tests de connexion backend

## 🐛 Dépannage

### Backend non accessible

1. Vérifier que WAMP est démarré
2. Vérifier l'URL dans `.env`
3. Vérifier les logs Apache
4. Tester l'API avec Postman/curl

### Erreurs CORS

- Vérifier la configuration `.htaccess`
- Vérifier les headers dans les réponses PHP

### Erreurs d'authentification

- Vérifier que le token est bien envoyé
- Vérifier la validation du token côté PHP
- Vérifier l'expiration du token

