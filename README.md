# Block-Notes

Application mobile de prise de notes développée avec Flutter.

---

## Fonctionnalités

- Créer, modifier et supprimer des notes
- Recherche en temps réel par titre ou contenu
- Couleurs personnalisées pour chaque note
- Tri par date (récent / ancien) ou par titre (A→Z / Z→A)
- Compteur de notes affiché dans l'AppBar
- Widget d'écran d'accueil (Android & iOS) affichant le compteur et la dernière note

---

## Technologies utilisées

| Technologie       | Rôle                           |
|-------------------|--------------------------------|
| Flutter           | Framework UI multiplateforme   |
| Provider          | Gestion d'état                 |
| home_widget       | Pont Flutter vers widget natif |
| WidgetKit (iOS)   | Widget écran d'accueil iOS 14+ |
| AppWidgetProvider | Widget écran d'accueil Android |

---

## Installation

```bash
# Cloner le dépôt
git clone https://github.com/AB-060/Block-Notes.git
cd Block-Notes

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

---

## Widget d'écran d'accueil

Le widget se met à jour automatiquement à chaque ajout, modification ou suppression de note.

Informations affichées :

- Nombre total de notes
- Titre et aperçu de la dernière note créée
- Couleur associée à la note
- Date de création

Tailles supportées : Small (2x2) et Medium (4x2).

---

## Branches

| Branche | Contenu                                  |
|---------|------------------------------------------|
| main    | Version stable                           |
| p1      | Fonctionnalités de base (CRUD)           |
| p2      | Recherche et tri                         |
| p3      | Widget d'écran d'accueil (Android & iOS) |

---

## Auteur

Développé par AB-060.