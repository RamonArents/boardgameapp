import 'package:boardgame_database/models/boardgame.dart';
import 'package:boardgame_database/services/database_service.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);

class BoardgameProvider extends ChangeNotifier {
  List<Boardgame> _boardgames = [];

  List<Boardgame> get boardgames => _boardgames;

  Future<void> loadBoardgames() async {
    _boardgames = await DatabaseService.instance.getBoardGames();
    notifyListeners();
  }
}