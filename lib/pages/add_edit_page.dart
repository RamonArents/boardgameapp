import 'package:boardgame_database/components/header_component.dart';
import 'package:boardgame_database/data/notifiers.dart';
import 'package:boardgame_database/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditPage extends StatefulWidget {
  final bool isEdit;
  final int? id;
  final String? name;

  const AddEditPage({super.key, this.isEdit = false, this.id, this.name});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final DatabaseService _databaseService = DatabaseService.instance;
  final TextEditingController _nameController = TextEditingController();

  String? _boardgame;

  String get _buttonText => widget.isEdit ? 'Bewerken' : 'Toevoegen';

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name ?? '';
    _boardgame = widget.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _addOrUpdateBoardgame() async {
    final gameName = _boardgame?.trim();
    if (gameName != null && gameName.isNotEmpty) {
      if (widget.isEdit) {
        if (widget.id != null) {
          _databaseService.updateBoardgame(widget.id!, gameName);
        }
      } else {
        _databaseService.addBoardgame(gameName);
      }

      await context.read<BoardgameProvider>().loadBoardgames();
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderComponent(
          title: widget.isEdit ? 'Bordspel bewerken' : 'Bordspel toevoegen',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _nameController,
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
              onPressed: _addOrUpdateBoardgame,
              child: Text(_buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
