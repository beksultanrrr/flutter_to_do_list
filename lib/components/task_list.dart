import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/models/task_data.dart';
import 'task_title.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            final task = taskData.tasks![index];
            return GestureDetector(
              onLongPress: () => taskData.removeTask(task),
              child: TaskTitle(
                isChecked: task.isDone,
                taskTitle: taskData.tasks![index].name,
                checkboxCallBack: (checkBoxState) {
                  // setState(() {
                  taskData.updateTitle(index);

                  // });
                },
              ),
            );
          },
          itemCount: taskData.getCount,
        );
      },
    );
  }
}
