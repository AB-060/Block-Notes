import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/note_service.dart';
import 'services/widget_service.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WidgetService.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => NoteService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc-Notes',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}