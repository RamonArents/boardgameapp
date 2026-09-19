import 'package:boardgame_database/components/dark_mode_button.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final bool isHomePage;

  const HeaderComponent({
    super.key,
    required this.title,
    this.isHomePage = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: const Color(0xFF9B7653),
      title: Text(title, style: TextStyle(color: Colors.white)),
      centerTitle: true,
      actions: [
        DarkModeButton(),
        if (isHomePage)
          IconButton(
            onPressed: () {
              // TODO: Hier straks database exporteren
            },
            icon: const Icon(Icons.exit_to_app),
          ),
      ],
    );
  }
}
