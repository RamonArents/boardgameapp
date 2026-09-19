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
      body: Text("Toevoegen / bewerken")
    );
  }
}
