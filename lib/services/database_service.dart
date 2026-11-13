import 'package:boardgame_database/models/boardgame.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  // Table
  final String _boardgameTableName = "boardgames";
  // Columns
  final String _boardgameIdColumnName = "id";
  final String _boardgameNameColumnName = "name";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasepath = join(databaseDirPath, "boardgames.db");
    final database = await openDatabase(
      databasepath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
       CREATE TABLE IF NOT EXISTS $_boardgameTableName (
        $_boardgameIdColumnName INTEGER PRIMARY KEY,
        $_boardgameNameColumnName TEXT NOT NULL
       )
      ''');
      },
    );
    return database;
  }

  void addBoardgame(String name) async {
    final db = await database;
    await db.insert(_boardgameTableName, {_boardgameNameColumnName: name});
  }

  void updateBoardgame(int id, String name) async {
    final db = await database;
    await db.update(_boardgameTableName, {
      _boardgameNameColumnName: name
    },
    where: "$_boardgameIdColumnName = ?",
    whereArgs: [id]);
  }

  Future<List<Boardgame>> getBoardGames() async {
    final db = await database;
    final data = await db.query(_boardgameTableName);
    return data
        .map(
          (e) => Boardgame(
            id: e["id"] as int,
            name: e["name"] as String,
          ),
        )
        .toList();
  }
}
