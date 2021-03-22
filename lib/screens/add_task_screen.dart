import 'package:do_me/database/databasemethods.dart';
import 'package:do_me/model/task.dart';
import 'package:do_me/services/tasksProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    late String _taskTitle;
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.only(top: 40.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  cursorColor: Colors.lightBlueAccent,
                  onChanged: (newValue) {
                    _taskTitle = newValue;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                  height: 60.0,
                  minWidth: MediaQuery.of(context).size.width / 1.2,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    if (textEditingController.text.isNotEmpty) {
                      final newTask = Task(taskTitle: _taskTitle);
                      TasksProvider().addTask(newTask);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
