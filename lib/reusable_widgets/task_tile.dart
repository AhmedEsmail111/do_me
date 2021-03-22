import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function onChangeState;
  final String title;
  final Function onLongPress;
  TaskTile({required this.isChecked, required this.onChangeState, required this.title, required this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress as void Function()?,
      title: Text(
        title,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        checkColor: Colors.white,
        onChanged: onChangeState as void Function(bool?)?,
      ),
    );
  }
}
