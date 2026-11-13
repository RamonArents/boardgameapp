import 'package:flutter/material.dart';

class DeletePopup extends StatefulWidget {
  final int? id;
  final String? name;

  const DeletePopup({super.key, this.id, this.name});

  @override
  State<DeletePopup> createState() => _DeletePopupState();
}

class _DeletePopupState extends State<DeletePopup> {
  late final String? _boardgameName;

  @override
  void initState() {
    super.initState();
    _boardgameName = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Verwijderen"),
      content: Text(
        "Weet je zeker dat je het bordspel $_boardgameName wil verwijderen?",
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Verwijderen'),
          onPressed: () => {
            //TODO: Implement delete
          },
        ),
        TextButton(
          child: Text('Annuleren'),
          onPressed: () => {Navigator.pop(context)},
        ),
      ],
    );
  }
}
