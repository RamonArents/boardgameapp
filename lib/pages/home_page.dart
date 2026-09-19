import 'package:boardgame_database/components/header_component.dart';
import 'package:boardgame_database/data/notifiers.dart';
import 'package:boardgame_database/pages/add_edit_page.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderComponent(
          title: 'Bordspellen overzicht',
          isHomePage: true,
        ),
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
                  children: List.generate(
                    15, // TODO: Render list from db
                    (index) => Container(
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
                          'Entry ${index + 1}',
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditPage()),
          ),
        },
        backgroundColor: Color(0xFF9B7653),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
