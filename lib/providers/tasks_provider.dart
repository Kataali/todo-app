import 'package:flutter/foundation.dart';

import '../models/task_model.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> tasksList = [
    Task(title: "Do homework", taskCategory: "school"),
    Task(title: "Decorate room", taskCategory: "personal"),
    Task(title: "Sleep for 30 mins", taskCategory: "personal")
  ];
  List<Task> _completedTasks = [];

  void addTask(Task task) {
    tasksList.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasksList.remove(task);
    notifyListeners();
  }

  void isDone(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasksList.remove(task);
    notifyListeners();
  }

  int get tasksListsLength => tasksList.length;
  Task getTaskByIndex(int index) => tasksList[index];
}
