import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/components/task_list.dart';

import 'package:to_do_list/models/task.dart';

import '../models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newtaskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(20))),
        // child: Padding(
        // padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newtaskTitle = value;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newtaskTitle);

                Navigator.pop(context, newtaskTitle);
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
