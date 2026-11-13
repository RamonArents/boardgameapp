import 'package:boardgame_database/components/header_component.dart';
import 'package:boardgame_database/data/notifiers.dart';
import 'package:boardgame_database/models/boardgame.dart';
import 'package:boardgame_database/pages/add_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: _boardgameList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditPage(isEdit: false)),
          ),
        },
        backgroundColor: Color(0xFF9B7653),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _boardgameList() {
    return Consumer<BoardgameProvider>(
      builder: (context, boardgameProvider, child) {
        final boardgames = boardgameProvider.boardgames;

        return ValueListenableBuilder<bool>(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDarkMode, child) {
            final backgroundColor = isDarkMode
                ? Colors.white
                : const Color(0xFF303030);

            final textColor = isDarkMode ? Colors.black : Colors.white;

            return ListView.builder(
              itemCount: boardgames.length,
              itemBuilder: (context, index) {
                final Boardgame boardgame = boardgames[index];

                return Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 0.3),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          boardgame.name,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: isDarkMode ? Colors.grey : Colors.grey[350],
                        ),
                        tooltip: 'Bewerken',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditPage(isEdit: true, id: boardgame.id, name: boardgame.name),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outlined,
                          color: (Colors.red[600]),
                        ),
                        tooltip: 'Verwijderen',
                        onPressed: () {
                          // TODO: Delete this board game from the database
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
