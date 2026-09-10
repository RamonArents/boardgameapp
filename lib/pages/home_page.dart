import 'package:boardgame_database/data/notifiers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9B7653),
        title: const Text(
          'Bordspellen overzicht',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder<bool>(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return isDarkMode
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: Hier straks database exporteren
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDarkMode, child) {
          final backgroundColor = isDarkMode
              ? Colors.white
              : const Color(0xFF303030);

          final textColor = isDarkMode ? Colors.black : Colors.white;

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: const Border(
                          bottom: BorderSide(color: Colors.black, width: 0.3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Entry A',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: const Border(
                          bottom: BorderSide(color: Colors.black, width: 0.3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Entry B',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: const Border(
                          bottom: BorderSide(color: Colors.black, width: 0.3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Entry C',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Fixed button at the bottom
              // TODO: Change to fab button (right bottom corner at screen)
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Add board game
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Bordspel toevoegen'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
