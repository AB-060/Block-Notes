import 'package:home_widget/home_widget.dart';
import '../models/note.dart';

class WidgetService {
  static const String _appGroupId = 'group.com.example.notes';
  static const String _iOSWidgetName = 'NotesWidget';
  static const String _androidWidgetName = 'com.example.notes.NotesWidgetProvider';

  static Future<void> init() async {
    await HomeWidget.setAppGroupId(_appGroupId);
  }

  static Future<void> update(List<Note> notes) async {
    final latest = notes.isNotEmpty ? notes.first : null;

    await Future.wait([
      HomeWidget.saveWidgetData<int>('notes_count', notes.length),
      HomeWidget.saveWidgetData<String>('latest_title', latest?.titre ?? ''),
      HomeWidget.saveWidgetData<String>(
        'latest_preview',
        latest != null
            ? (latest.contenu.length > 60
                ? '${latest.contenu.substring(0, 60)}…'
                : latest.contenu)
            : '',
      ),
      HomeWidget.saveWidgetData<String>('latest_color', latest?.couleur ?? '#FFE082'),
      HomeWidget.saveWidgetData<String>(
        'latest_date',
        latest != null
            ? '${latest.dateCreation.day}/${latest.dateCreation.month}/${latest.dateCreation.year}'
            : '',
      ),
    ]);

    await HomeWidget.updateWidget(
      androidName: _androidWidgetName,
      iOSName: _iOSWidgetName,
      qualifiedAndroidName: _androidWidgetName,
    );
  }
}