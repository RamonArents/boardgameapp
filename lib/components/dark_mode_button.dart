import 'package:boardgame_database/data/notifiers.dart';
import 'package:flutter/material.dart';

class DarkModeButton extends StatelessWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isDarkModeNotifier.value = !isDarkModeNotifier.value;
      },
      icon: ValueListenableBuilder<bool>(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDarkMode, child) {
          return isDarkMode
              ?  Icon(Icons.dark_mode)
              :  Icon(Icons.light_mode);
        },
      ),
    );
  }
}
