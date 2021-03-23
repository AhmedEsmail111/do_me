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
  }
  void initializeTasks() async {
    _tasks = await getTasks();
    notifyListeners();
  }

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  addTask(Task task) {
    insertTask(task);
    initializeTasks();
  }

  update({required Task newTask, required int index}) {
    updateTask(newTask: newTask, index: index);
    initializeTasks();
  }

  delete(int index) {
    deleteTask(index);
    initializeTasks();
  }
}
