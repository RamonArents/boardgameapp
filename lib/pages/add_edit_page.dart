import 'package:boardgame_database/components/header_component.dart';
import 'package:boardgame_database/services/database_service.dart';
import 'package:flutter/material.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({super.key});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final DatabaseService _databaseService = DatabaseService.instance;

  String? _boardgame;

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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _boardgame = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Bordspel naam',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF9B7653),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                final gameName = _boardgame?.trim();
                if (gameName != null && gameName.isNotEmpty) {
                  _databaseService.addBoardgame(gameName);
                }
              },
              child: const Text('Toevoegen'),
            ),
          ),
        ],
      ),
    );
  }
}
