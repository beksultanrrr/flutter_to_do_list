import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  const TaskTitle(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
          title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallBack(newValue);
          });
  
  }
}
