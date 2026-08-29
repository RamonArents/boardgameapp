import 'package:boardgame_database/data/notifiers.dart';
import 'package:boardgame_database/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (BuildContext context, dynamic isDarkMode, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF9B7653),
              brightness: isDarkMode ? Brightness.light : Brightness.dark,
            ),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
