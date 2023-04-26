import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "1"),
    Task(name: "2"),
    Task(name: "3"),
    Task(name: "4"),
    Task(name: "5"),
  ];

  int get getCount {
    return _tasks.length;
  }

  void addTask(String newValue) {
    _tasks.add(Task(name: newValue));
    notifyListeners();
  }

  UnmodifiableListView<Task>? get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateTitle(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTask(index) {
    _tasks.remove(index);
    notifyListeners();
  }
}
