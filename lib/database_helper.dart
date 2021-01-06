import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/task.dart';
class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
        join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, mileage INTEGER, nextinterval INTEGER, partcost INTEGER, labor INTEGER, details TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    Database _db = await database();
    await _db.insert(
        'tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async{
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateMileage(int id, int mileage) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET mileage = '$mileage' WHERE id = '$id'");
  }

  Future<void> updateNextInterval(int id, int nextinterval) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET nextinterval = '$nextinterval' WHERE id = '$id'");
  }

  Future<void> updatePartCost(int id, int partcost) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET partcost = '$partcost' WHERE id = '$id'");
  }

  Future<void> updateLabor(int id, int labor) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET labor = '$labor' WHERE id = '$id'");
  }

  Future<void> updateDetails(int id, String details) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET details = '$details' WHERE id = '$id'");
  }


  Future<List<Task>> getTasks() async{
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index){
      return Task(id: taskMap[index]['id'],title: taskMap[index]['title'],mileage: taskMap[index]['mileage'],nextinterval: taskMap[index]['nextinterval'],partcost: taskMap[index]['partcost'],labor: taskMap[index]['labor'],details: taskMap[index]['details']);
    });
  }

}