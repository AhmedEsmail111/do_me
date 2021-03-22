import 'package:do_me/model/task.dart';

import '../reusable_widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final String taskTitle;
  final bool isDone;
  final Function onChanged;
  final Function onLongPress;
  TasksList({required this.isDone, required this.taskTitle, required this.onChanged, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return TaskTile(
      title: taskTitle,
      isChecked: isDone,
      onChangeState: onChanged,
      onLongPress: onLongPress,
    );
  }
}
