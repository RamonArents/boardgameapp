import 'package:boardgame_database/components/header_component.dart';
import 'package:flutter/material.dart';

class AddEditPage extends StatelessWidget {
  const AddEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderComponent(title: 'Bordspel toevoegen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Bordspel naam',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF9B7653),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () => {},
              // TODO: toevoegen of bewerken op basis van isEdit
              child: Text("Toevoegen"),
            ),
          ),
        ],
      ),
    );
  }
}
