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

A mobile note-taking application built with Flutter.

---

## Features

- Create, edit and delete notes
- Real-time search by title or content
- Custom colors for each note
- Sort by date (newest / oldest) or by title (A→Z / Z→A)
- Note counter displayed in the AppBar
- Home screen widget (Android & iOS) showing the counter and latest note

---

## Technologies

| Technology        | Role                            |
|-------------------|---------------------------------|
| Flutter           | Cross-platform UI framework     |
| Provider          | State management                |
| home_widget       | Flutter to native widget bridge |
| WidgetKit (iOS)   | iOS 14+ home screen widget      |
| AppWidgetProvider | Android home screen widget      |

---

## Installation

```bash

# Cloner le dépôt
git clone https://github.com/AB-060/Block-Notes.git
cd Block-Notes

# Installer les dépendances
flutter pub get

# Lancer l'application

# Clone the repository
git clone https://github.com/AB-060/Block-Notes.git
cd Block-Notes

# Install dependencies
flutter pub get

# Run the application

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

## Home Screen Widget

The widget updates automatically after every add, edit or delete operation.

Displayed information:

- Total number of notes
- Title and preview of the latest note
- Color associated with the note
- Creation date

Supported sizes: Small (2x2) and Medium (4x2).


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

| Branch | Content                                  |
|--------|------------------------------------------|
| main   | Stable version                           |
| p1     | Basic features (CRUD)                    |
| p2     | Search and sorting                       |
| p3     | Home screen widget (Android & iOS)       |

---

## Author

Developed by AB-060.

