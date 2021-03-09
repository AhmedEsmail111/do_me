import 'package:do_me/screens/to_do_screen.dart';
import 'package:do_me/services/tasksProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
