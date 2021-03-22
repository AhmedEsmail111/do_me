import 'dart:collection';
import 'dart:async';
import 'package:do_me/database/databasemethods.dart';
import 'package:do_me/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../main.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  TasksProvider() {
    initializeTasks();
    notifyListeners();
  }

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  Future<void> addTask(Task task) async {
    insertTask(task);
    initializeTasks();
    notifyListeners();
  }

  void initializeTasks() async {
    _tasks = await getTasks();
    notifyListeners();
  }

  update({required Task newTask, required int index}) {
    updateTask(newTask: newTask, index: index);
    notifyListeners();
  }

  delete(int index) {
    deleteTask(index);
    notifyListeners();
  }
}
