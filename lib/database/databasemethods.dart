import 'dart:async';
import 'package:do_me/model/task.dart';
import 'package:do_me/services/tasksProvider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:do_me/main.dart';

Future<void> insertTask(Task task) async {
  final Database db = await database;
  await db.insert(
    'tasks',
    task.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Task>> getTasks() async {
  // get a reference to the data base
  final Database db = await database;
  //query the database to get the data
  List<Map<String, dynamic>> maps = await db.query('tasks');
  // convert the list<Map<String,dynamic>> to a List<Task>
  List<Task> tasks = List.generate(maps.length, (index) {
    return Task(
      id: maps[index]['id'],
      taskTitle: maps[index]['taskTitle'],
      isDone: maps[index]['isDone'],
    );
  });
  return tasks;
}

Future<void> updateTask({required Task newTask, required int index}) async {
  // get a reference to the data base
  final Database db = await database;
// Update the given Task.
  await db.update(
    'tasks',
    newTask.toMap(),
    // Ensure that the Dog has a matching id.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [index],
  );
}

Future<void> deleteTask(int index) async {
  // get a reference to the data base
  final Database db = await database;
// Delete the given Task.
  await db.delete(
    'tasks',
    // Ensure that the Dog has a matching id.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [index],
  );
}
