import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  //Create Database Function
  static Future<sql.Database> createDatabase() async {
    return await sql.openDatabase('itelec2.db', version: 1,
        onCreate: (sql.Database database, version) async {
      await createTables(database);
    });
  }

  //Create Tables Function
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        fullName TEXT,
        year TEXT,
        block TEXT,
        dateCreated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    """);
  }

  ///Insert Student function
  static Future<int> insertStudent(
      String? fullName, String? year, String block) async {
    final db = await DatabaseHelper.createDatabase();
    final data = {'fullname': fullName, 'year': year, 'block': block};
    final res = db.insert('students', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return res;
  }

  //Function to retrieve all Student data
  static Future<List<Map<String, dynamic>>>? retrieveAllStudents() async {
    final db = await DatabaseHelper.createDatabase();
    return await db.query('students', orderBy: 'fullname');
  }

  //Function to update student data
  static Future<int> updateStudent(
      int id, String? fullName, String? year, String? block) async {
    final db = await DatabaseHelper.createDatabase();
    final res = db.rawUpdate(
        "UPDATE students SET fullname = '$fullName', year ='$year', block ='$block' WHERE id = $id ");
    return res;
  }

  //Function to delete student data
  static Future<int> deleteStudent(int id) async {
    final db = await DatabaseHelper.createDatabase();
    final res = db.rawDelete("DELETE FROM students WHERE id = $id");
    return res;
  }
}
