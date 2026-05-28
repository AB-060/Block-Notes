# Block-Notes

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
# Clone the repository
git clone https://github.com/AB-060/Block-Notes.git
cd Block-Notes

# Install dependencies
flutter pub get

# Run the application
flutter run
```

---

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

| Branch | Content                                  |
|--------|------------------------------------------|
| main   | Stable version                           |
| p1     | Basic features (CRUD)                    |
| p2     | Search and sorting                       |
| p3     | Home screen widget (Android & iOS)       |

---

## Author

Developed by AB-060.
