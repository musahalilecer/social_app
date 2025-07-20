import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'social_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE accounts(
        id TEXT PRIMARY KEY,
        username TEXT,
        password TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE messages(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        senderId TEXT,
        receiverId TEXT,
        content TEXT,
        timestamp TEXT
      )
    ''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<int> delete(String id, String table) async {
    final db = await database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(String id, String table, Map<String, dynamic> data) async {
    final db = await database;
    return db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await database;
    return await db.query(table);
  }

  // OTHER HIGH LEVEL OPERATIONS

  Future<int> countPosts() async {
    final db = await database;
    final result = await db.rawQuery("SELECT COUNT(*) FROM posts");
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future <List<Map<String, dynamic>>> getAllMessageByUser(String userId) async{
    final db = await database;
    return await db.query(
      'messages',
      where: 'senderId = ? OR receiverId = ?',
      whereArgs: [userId],
    );
  }
}
