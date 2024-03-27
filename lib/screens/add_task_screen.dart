import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../providers/tasks_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final titleController = TextEditingController();
  static GlobalKey<FormState> _addtaskScreenFormKey = GlobalKey<FormState>();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context);

    return Column(
      children: [
        const Text("Add New Task"),
        Form(
          key: _addtaskScreenFormKey,
          child: TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Task Title"),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Task newTask =
                Task(title: titleController.value.text, taskCategory: "home");
            provider.addTask(newTask);
            _addtaskScreenFormKey.currentState?.save();
            titleController.clear();
            Navigator.pop(context);
          },
          child: const Text("Add"),
        )
      ],
    );
  }
}
