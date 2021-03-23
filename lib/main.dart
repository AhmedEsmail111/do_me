import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:do_me/screens/to_do_screen.dart';
import 'package:do_me/services/tasksProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late final Future<Database> database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), 'tasks_database.db'),
    onCreate: (db, version) {
      db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY, taskTitle TEXT, isDone INTEGER)",
      );
    },
    version: 1,
  );
  TasksProvider();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TasksProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ToDoScreen(),
      ),
    );
  }
}
