import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBhelper{
  static Future<sql.Database> database() async{
    final dbPath= await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath,'places.db'),
      onCreate: ((db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image_path TEXT)',
          );
      }),
      version: 1
    );
  }
  // Static Methods============================================================
  static Future<void> insert(String table ,Map<String,Object> data) async {
    final sqlDB=await DBhelper.database();
    sqlDB.insert(
      table,data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace, //to replace data with same id
      );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final sqlDB=await DBhelper.database();
    return sqlDB.query(table);
  }

  // Methods============================================================
}