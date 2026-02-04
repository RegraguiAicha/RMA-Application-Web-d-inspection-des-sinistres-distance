# RMA Assurance Reclamation - Frontend

Application React/TypeScript moderne pour la gestion des réclamations d'assurance avec inspection à distance.

## 🚀 Technologies

- **React 18** avec TypeScript
- **Vite** pour le build et le développement
- **Tailwind CSS** pour le styling
- **Shadcn/ui** pour les composants UI
- **React Router** pour la navigation
- **React Hook Form** pour les formulaires
- **Zod** pour la validation
- **Lucide React** pour les icônes
- **React Query** pour la gestion d'état

## 📁 Structure du Projet

```
rma-assurance-reclamation-main/
├── src/
│   ├── components/
│   │   └── ui/                 # Composants Shadcn/ui
│   ├── pages/                  # Pages de l'application
│   │   ├── Index.tsx          # Page d'accueil
│   │   ├── ClientLogin.tsx    # Connexion client
│   │   ├── ClientDashboard.tsx # Dashboard client
│   │   ├── NewClaim.tsx       # Nouvelle réclamation
│   │   ├── TeamLogin.tsx      # Connexion équipe
│   │   ├── TeamDashboard.tsx  # Dashboard équipe
│   │   ├── EmployeeQR.tsx     # QR Code employé
│   │   └── NotFound.tsx       # Page 404
│   ├── hooks/                 # Hooks personnalisés
│   ├── lib/                   # Utilitaires
│   ├── assets/                # Images et ressources
│   ├── App.tsx               # Composant principal
│   ├── main.tsx              # Point d'entrée
│   └── index.css             # Styles globaux
├── public/                    # Fichiers statiques
├── package.json
├── vite.config.ts
├── tailwind.config.ts
├── tsconfig.json
└── README.md
```

## 🛠️ Installation

1. **Cloner le projet**
```bash
git clone <repository-url>
cd rma-assurance-reclamation-main
```

2. **Installer les dépendances**
```bash
npm install
```

3. **Démarrer le serveur de développement**
```bash
npm run dev
```

L'application sera accessible sur `http://localhost:8080`

## 📋 Scripts Disponibles

- `npm run dev` - Démarre le serveur de développement
- `npm run build` - Build de production
- `npm run build:dev` - Build de développement
- `npm run lint` - Vérification du code avec ESLint
- `npm run preview` - Prévisualisation du build

## 🎨 Design System

Le projet utilise un design system moderne avec :

- **Couleurs principales** : Bleu professionnel (#1E40AF)
- **Couleurs d'accent** : Orange (#F59E0B)
- **Gradients** : Dégradés modernes pour les éléments UI
- **Animations** : Transitions fluides et micro-interactions
- **Responsive** : Design adaptatif pour tous les écrans

## 📱 Pages Disponibles

### 🏠 Page d'Accueil (`/`)
- Présentation de l'application
- Sélection du type d'utilisateur
- Navigation vers les différents espaces

### 👤 Espace Client
- **Connexion** (`/client-login`) : Authentification client
- **Dashboard** (`/client-dashboard`) : Gestion des réclamations
- **Nouvelle Réclamation** (`/new-claim`) : Création de dossier

### 👥 Espace Équipe
- **Connexion** (`/team-login`) : Authentification équipe
- **Dashboard** (`/team-dashboard`) : Gestion des dossiers

### 🔗 Accès Employé
- **QR Code** (`/employee-qr`) : Connexion rapide via QR

## 🔧 Configuration

### Variables d'Environnement
Créez un fichier `.env.local` à la racine du projet :

```env
VITE_API_URL=http://localhost:5000
VITE_APP_NAME=RMA Vision
```

### Tailwind CSS
Le projet utilise Tailwind CSS avec une configuration personnalisée incluant :
- Variables CSS personnalisées
- Gradients et ombres personnalisés
- Animations et transitions
- Support du mode sombre

## 🚀 Déploiement

### Build de Production
```bash
npm run build
```

Les fichiers de production seront générés dans le dossier `dist/`.

### Serveur de Prévisualisation
```bash
npm run preview
```

## 📝 Notes de Développement

- **TypeScript** : Configuration stricte pour la qualité du code
- **ESLint** : Règles de linting personnalisées
- **Prettier** : Formatage automatique du code
- **Husky** : Hooks Git pour la qualité du code

## 🤝 Contribution

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 🆘 Support

Pour toute question ou problème :
- Ouvrir une issue sur GitHub
- Contacter l'équipe de développement

---

**RMA Vision** - Simplifiez l'inspection à distance de vos sinistres d'assurance.
