import 'package:boardgame_database/data/notifiers.dart';
import 'package:boardgame_database/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletePopup extends StatefulWidget {
  final int? id;
  final String? name;

  const DeletePopup({super.key, this.id, this.name});

  @override
  State<DeletePopup> createState() => _DeletePopupState();
}

class _DeletePopupState extends State<DeletePopup> {
  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<void> handleDelete() async {
    _databaseService.deleteBoardgame(widget.id!);
    await context.read<BoardgameProvider>().loadBoardgames();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Verwijderen"),
      content: Text(
        "Weet je zeker dat je het bordspel ${widget.name} wil verwijderen?",
      ),
      actions: <Widget>[
        TextButton(
          onPressed: handleDelete,
          child: Text('Verwijderen'),

        ),
        TextButton(
          child: Text('Annuleren'),
          onPressed: () => {Navigator.pop(context)},
        ),
      ],
    );
  }
}
