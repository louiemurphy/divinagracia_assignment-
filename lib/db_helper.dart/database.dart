import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';




class DatabaseConnection {
  Future<Database> setDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_crud.db');
    var database =
    await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }


  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        "CREATE TABLE users (id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "contact Text,"
        "description TEXT"
        ");";
    await database.execute(sql);
  }
}
