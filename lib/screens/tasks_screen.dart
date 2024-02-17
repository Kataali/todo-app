import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          const Text("Future"),
          Expanded(
            child: ListView(
              children: [
                TaskTile(taskTitle: "Do Groceries", date: DateTime.now()),
                TaskTile(taskTitle: "Do homework", date: DateTime.now())
              ],
            ),
          )
        ]),
      ),
    );
  }
}
