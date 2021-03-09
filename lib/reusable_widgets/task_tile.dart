import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function onChangeState;
  final String title;
  final Function onLongPress;
  TaskTile({this.isChecked, this.onChangeState, this.title, this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
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
        onChanged: onChangeState,
      ),
    );
  }
}
