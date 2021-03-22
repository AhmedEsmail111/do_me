import 'package:do_me/database/databasemethods.dart';
import 'package:do_me/model/task.dart';
import 'package:do_me/reusable_widgets/tasks_list.dart';
import 'package:do_me/screens/add_task_screen.dart';
import 'package:do_me/services/tasksProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 60.0,
              right: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 38.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 50.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Do Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TasksProvider>(context, listen: true).tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: ListView.builder(
                    itemCount: Provider.of<TasksProvider>(context, listen: true)
                        .tasks
                        .length,
                    itemBuilder: (context, index) {
                      // a reference to the current task index
                      final task =
                          Provider.of<TasksProvider>(context, listen: true)
                              .tasks[index];

                      return TasksList(
                        taskTitle: task.taskTitle,
                        isDone: task.isDone == 0 ? false : true,
                        onChanged: (value) {
                          int buttonState = value == true ? 1 : 0;
                          final newTask = Task(
                              taskTitle: task.taskTitle,
                              isDone: buttonState,
                              id: task.id);
                          Provider.of<TasksProvider>(context, listen: false)
                              .update(newTask: newTask, index: task.id);
                        },
                        onLongPress: () {
                          Provider.of<TasksProvider>(context, listen: false)
                              .delete(task.id);
                        },
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
