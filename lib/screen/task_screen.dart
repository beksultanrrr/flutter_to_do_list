import 'package:flutter/material.dart';
import 'package:to_do_list/components/task_list.dart';

import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:to_do_list/screen/add_task_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              shape:
              const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30)));
              return AddTaskScreen();
            },
          );
          // ).then((value) {
          //   if(value is ChatModel){
          //   print(value);

          //   }
          // });
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
              padding:
                  EdgeInsets.only(top: 60, left: 10, right: 130, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.density_medium,
                          color: Colors.lightBlueAccent,
                          size: 30,
                        )),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).getCount} task",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )
                ],
              )),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: TaskList(
                    tasks:
                        Provider.of<TaskData>(context, listen: false).tasks!)),
            flex: 2,
          )
        ],
      ),
    );
  }
}
