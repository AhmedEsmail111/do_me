import 'dart:collection';

import 'package:do_me/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _taskList = [];

  UnmodifiableListView get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addTask(String taskTitle) {
    final newTask = Task(taskTitle: taskTitle);
    _taskList.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int task) {
    _taskList.removeAt(task);
    notifyListeners();
  }
}
