import 'dart:async';
import 'package:flutter_car_app/src/contrat.dart';
import 'package:flutter_car_app/src/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();
  static Database? _database;
  factory DatabaseHelper() => _instance;

  static Database? _db;
//how to view sqlite table in vscode
  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }
  
Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
  print("linnnnnnnnnnnnnnnne    ${databasePath}");
    final path = join(databasePath, 'users.db');
    return await openDatabase(
      path,
      version: 12,
      onCreate: (db, version) async {
        await _onCreate(db, version);
        await _onCreateContracts(db, version); // Add this line
      },
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, email TEXT, password TEXT)',
    );
  }
  Future<int> saveUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    print(user["password"]);
    return await dbClient.insert('users', user);
  }
Future<int> saveContract(Map<String, dynamic> contract) async {
  var dbClient = await db;
  print(contract);
  return await dbClient.insert('contracts', contract);
}


 Future<Map<String, dynamic>?> getUser(String email, String password) async {
  var dbClient = await db;
  List<Map<String, dynamic>> result = await dbClient.query(
    'users',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );
  if (result.isNotEmpty) {
    return result.first;
  }
  return null;
}
Future<void> _onCreateContracts(Database db, int version) async {
  await db.execute('''
    CREATE TABLE contracts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      surname TEXT,
      dateDebut TEXT,
      dateFin TEXT,
      cin TEXT,
      imageCin TEXT,
      imagePermis TEXT
    )
  ''');
}


  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.db;
    return await db.query('users');
  }

  Future<List<Contract>> getAllContracts() async {
    Database db = await instance.db;
    List<Map<String, dynamic>> maps = await db.query('contracts');
    return List.generate(maps.length, (index) => Contract.fromMap(maps[index]));
  }

Future<String?> getItem(int id) async {
    final db = await instance.db;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.first['name'];
    }
    return null;
  }
   Future<Map<String, dynamic>> getItemAndAllNames(int id) async {
    final db = await instance.db;

    // Get single item name by id
    List<Map<String, dynamic>> itemResult = await db.query(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
    String? itemName;
    if (itemResult.isNotEmpty) {
      itemName = itemResult.first['name'];
    }

    // Get all item names
    List<Map<String, dynamic>> allItemsResult = await db.query('items');
    List<String> allItemNames = allItemsResult.map((item) => item['name'] as String).toList();

    return {
      'itemName': itemName,
      'allItemNames': allItemNames,
    };
  }
}