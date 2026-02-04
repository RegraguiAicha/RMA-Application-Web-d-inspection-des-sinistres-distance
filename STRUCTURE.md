# Structure du Projet RMA Vision

## 📁 Organisation des Fichiers

```
rma-assurance-reclamation-main/
├── 📄 README.md                    # Documentation principale
├── 📄 STRUCTURE.md                 # Ce fichier - Structure détaillée
├── 📄 package.json                 # Dépendances et scripts
├── 📄 package-lock.json            # Verrouillage des versions
├── 📄 vite.config.ts              # Configuration Vite
├── 📄 tsconfig.json               # Configuration TypeScript
├── 📄 tsconfig.app.json           # Configuration TypeScript App
├── 📄 tsconfig.node.json          # Configuration TypeScript Node
├── 📄 tailwind.config.ts          # Configuration Tailwind CSS
├── 📄 postcss.config.js           # Configuration PostCSS
├── 📄 eslint.config.js            # Configuration ESLint
├── 📄 components.json             # Configuration Shadcn/ui
├── 📄 .gitignore                  # Fichiers ignorés par Git
├── 📄 index.html                  # Point d'entrée HTML
├── 📄 bun.lockb                   # Verrouillage Bun (optionnel)
│
├── 📁 src/                        # Code source principal
│   ├── 📄 main.tsx               # Point d'entrée React
│   ├── 📄 App.tsx                # Composant principal
│   ├── 📄 App.css                # Styles du composant App
│   ├── 📄 index.css              # Styles globaux
│   ├── 📄 vite-env.d.ts          # Types Vite
│   │
│   ├── 📁 config/                # Configuration
│   │   └── 📄 app.ts             # Configuration centralisée
│   │
│   ├── 📁 types/                 # Types TypeScript
│   │   └── 📄 index.ts           # Types centralisés
│   │
│   ├── 📁 lib/                   # Utilitaires et constantes
│   │   ├── 📄 utils.ts           # Fonctions utilitaires
│   │   └── 📄 constants.ts       # Constantes de l'application
│   │
│   ├── 📁 components/            # Composants réutilisables
│   │   └── 📁 ui/                # Composants Shadcn/ui
│   │       ├── 📄 accordion.tsx
│   │       ├── 📄 alert-dialog.tsx
│   │       ├── 📄 alert.tsx
│   │       ├── 📄 aspect-ratio.tsx
│   │       ├── 📄 avatar.tsx
│   │       ├── 📄 badge.tsx
│   │       ├── 📄 breadcrumb.tsx
│   │       ├── 📄 button.tsx
│   │       ├── 📄 calendar.tsx
│   │       ├── 📄 card.tsx
│   │       ├── 📄 carousel.tsx
│   │       ├── 📄 chart.tsx
│   │       ├── 📄 checkbox.tsx
│   │       ├── 📄 collapsible.tsx
│   │       ├── 📄 command.tsx
│   │       ├── 📄 context-menu.tsx
│   │       ├── 📄 dialog.tsx
│   │       ├── 📄 drawer.tsx
│   │       ├── 📄 dropdown-menu.tsx
│   │       ├── 📄 form.tsx
│   │       ├── 📄 hover-card.tsx
│   │       ├── 📄 input-otp.tsx
│   │       ├── 📄 input.tsx
│   │       ├── 📄 label.tsx
│   │       ├── 📄 menubar.tsx
│   │       ├── 📄 navigation-menu.tsx
│   │       ├── 📄 pagination.tsx
│   │       ├── 📄 popover.tsx
│   │       ├── 📄 progress.tsx
│   │       ├── 📄 radio-group.tsx
│   │       ├── 📄 resizable.tsx
│   │       ├── 📄 scroll-area.tsx
│   │       ├── 📄 select.tsx
│   │       ├── 📄 separator.tsx
│   │       ├── 📄 sheet.tsx
│   │       ├── 📄 sidebar.tsx
│   │       ├── 📄 skeleton.tsx
│   │       ├── 📄 slider.tsx
│   │       ├── 📄 sonner.tsx
│   │       ├── 📄 switch.tsx
│   │       ├── 📄 table.tsx
│   │       ├── 📄 tabs.tsx
│   │       ├── 📄 textarea.tsx
│   │       ├── 📄 toast.tsx
│   │       ├── 📄 toaster.tsx
│   │       ├── 📄 toggle-group.tsx
│   │       ├── 📄 toggle.tsx
│   │       └── 📄 tooltip.tsx
│   │
│   ├── 📁 pages/                  # Pages de l'application
│   │   ├── 📄 Index.tsx          # Page d'accueil
│   │   ├── 📄 ClientLogin.tsx    # Connexion client
│   │   ├── 📄 ClientDashboard.tsx # Dashboard client
│   │   ├── 📄 NewClaim.tsx       # Nouvelle réclamation
│   │   ├── 📄 TeamLogin.tsx      # Connexion équipe
│   │   ├── 📄 TeamDashboard.tsx  # Dashboard équipe
│   │   ├── 📄 EmployeeQR.tsx     # QR Code employé
│   │   └── 📄 NotFound.tsx       # Page 404
│   │
│   ├── 📁 hooks/                  # Hooks personnalisés
│   │   ├── 📄 use-mobile.tsx     # Hook pour détecter mobile
│   │   └── 📄 use-toast.ts       # Hook pour les notifications
│   │
│   └── 📁 assets/                 # Ressources statiques
│       └── 📄 hero-image.jpg     # Image d'accueil
│
├── 📁 public/                     # Fichiers publics
│   ├── 📄 favicon.ico            # Icône du site
│   ├── 📄 placeholder.svg        # Image placeholder
│   └── 📄 robots.txt             # Configuration robots
│
└── 📁 dist/                       # Build de production (généré)
    ├── 📄 index.html
    └── 📁 assets/
        ├── 📄 index-*.css
        ├── 📄 index-*.js
        └── 📄 hero-image-*.jpg
```

## 🏗️ Architecture du Code

### 1. **Configuration Centralisée** (`src/config/app.ts`)
- Variables d'environnement
- Configuration API
- Routes de l'application
- Paramètres de design
- Messages de l'application

### 2. **Types TypeScript** (`src/types/index.ts`)
- Interfaces utilisateur
- Types de réclamation
- Types de formulaire
- Types d'API
- Types de navigation

### 3. **Utilitaires** (`src/lib/`)
- **utils.ts** : Fonctions utilitaires (formatage, validation, etc.)
- **constants.ts** : Constantes de l'application

### 4. **Composants UI** (`src/components/ui/`)
- Composants Shadcn/ui personnalisés
- Design system cohérent
- Accessibilité intégrée

### 5. **Pages** (`src/pages/`)
- Pages principales de l'application
- Navigation React Router
- Responsive design

### 6. **Hooks Personnalisés** (`src/hooks/`)
- Logique métier réutilisable
- Gestion d'état locale
- Intégration avec les APIs

## 🎨 Design System

### Couleurs
- **Primaire** : #1E40AF (Bleu professionnel)
- **Accent** : #F59E0B (Orange)
- **Succès** : #10B981 (Vert)
- **Erreur** : #EF4444 (Rouge)
- **Avertissement** : #F59E0B (Orange)

### Typographie
- **Police principale** : Inter (via Tailwind)
- **Tailles** : xs, sm, base, lg, xl, 2xl, 3xl, 4xl, 5xl
- **Poids** : normal, medium, semibold, bold

### Espacement
- **Système** : 4px, 8px, 12px, 16px, 20px, 24px, 32px, 40px, 48px, 64px
- **Responsive** : Adaptatif selon les breakpoints

### Animations
- **Durée** : 150ms (rapide), 300ms (normal), 500ms (lent)
- **Easing** : cubic-bezier(0.4, 0, 0.2, 1)
- **Transitions** : Hover, focus, active states

## 📱 Responsive Design

### Breakpoints
- **Mobile** : < 640px
- **Tablet** : 640px - 1024px
- **Desktop** : > 1024px
- **Large Desktop** : > 1280px

### Stratégie
- **Mobile First** : Design basé sur mobile
- **Progressive Enhancement** : Amélioration progressive
- **Flexible Layouts** : Grilles et flexbox
- **Touch Friendly** : Interactions tactiles

## 🔧 Configuration Technique

### Build Tools
- **Vite** : Build tool rapide
- **TypeScript** : Typage statique
- **Tailwind CSS** : Framework CSS utilitaire
- **PostCSS** : Traitement CSS

### Linting & Formatting
- **ESLint** : Analyse de code
- **TypeScript ESLint** : Règles TypeScript
- **Prettier** : Formatage automatique

### Performance
- **Code Splitting** : Chargement à la demande
- **Tree Shaking** : Élimination du code inutilisé
- **Minification** : Réduction de la taille
- **Gzip** : Compression des assets

## 🚀 Scripts Disponibles

```bash
# Développement
npm run dev          # Serveur de développement
npm run build        # Build de production
npm run build:dev    # Build de développement
npm run preview      # Prévisualisation du build

# Qualité du code
npm run lint         # Vérification ESLint
npm run type-check   # Vérification TypeScript
```

## 📦 Dépendances Principales

### Core
- **React 18** : Framework UI
- **TypeScript** : Typage statique
- **Vite** : Build tool

### UI & Styling
- **Tailwind CSS** : Framework CSS
- **Shadcn/ui** : Composants UI
- **Lucide React** : Icônes
- **Radix UI** : Primitives UI

### Routing & State
- **React Router** : Navigation
- **React Query** : Gestion d'état serveur
- **React Hook Form** : Formulaires

### Utilitaires
- **Zod** : Validation de schémas
- **date-fns** : Manipulation de dates
- **clsx** : Classes CSS conditionnelles

## 🔒 Sécurité

### Bonnes Pratiques
- **Validation côté client** : Zod schemas
- **Sanitisation** : Échappement des données
- **CORS** : Configuration appropriée
- **HTTPS** : En production

### Variables d'Environnement
- **Séparation** : Dev/Prod/Test
- **Validation** : Vérification des variables requises
- **Sécurité** : Pas de secrets dans le code

## 📈 Performance

### Métriques
- **First Contentful Paint** : < 1.5s
- **Largest Contentful Paint** : < 2.5s
- **Cumulative Layout Shift** : < 0.1
- **First Input Delay** : < 100ms

### Optimisations
- **Lazy Loading** : Chargement à la demande
- **Image Optimization** : Formats modernes
- **Bundle Splitting** : Séparation du code
- **Caching** : Stratégies appropriées

## 🧪 Tests

### Stratégie
- **Unit Tests** : Composants individuels
- **Integration Tests** : Flux utilisateur
- **E2E Tests** : Scénarios complets

### Outils Recommandés
- **Vitest** : Tests unitaires
- **React Testing Library** : Tests composants
- **Playwright** : Tests E2E

## 📚 Documentation

### Code
- **JSDoc** : Documentation des fonctions
- **TypeScript** : Types explicites
- **Comments** : Explications complexes

### API
- **OpenAPI** : Spécification API
- **Examples** : Cas d'usage
- **Error Codes** : Codes d'erreur

## 🔄 Workflow de Développement

### Git Flow
1. **Feature Branch** : Développement de fonctionnalités
2. **Pull Request** : Revue de code
3. **Merge** : Intégration en main
4. **Release** : Tag de version

### CI/CD
- **Build** : Vérification automatique
- **Tests** : Exécution des tests
- **Deploy** : Déploiement automatique

---

Cette structure garantit une organisation claire, une maintenabilité élevée et une évolutivité du projet RMA Vision.
