import 'package:note_vault_flutter/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Singleton pattern
  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'noteVault.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
    } catch (e) {
      print("Error initializing the database: $e");
      rethrow; // Rethrow to see the full stack trace in debug mode
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        createdAt TEXT
      )
    ''');
  }

  // Insert a note into the database
  Future<int> insertNote(Note note) async {
    Database db = await database;
    note.createdAt = DateTime.now().toIso8601String();
    return await db.insert('notes', note.toMap());
  }

  // Retrieve all notes from the database
  Future<List<Map<String, dynamic>>> getNotes() async {
    Database db = await database;
    return await db.query('notes');
  }

  // Delete a note from the database
  Future<int> deleteNote(int id) async {
    Database db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  // Update a note in the database
  Future<int> updateNote(int id, Map<String, dynamic> note) async {
    Database db = await database;
    return await db.update('notes', note, where: 'id = ?', whereArgs: [id]);
  }
}
