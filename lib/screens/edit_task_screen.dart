import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';
import '../providers/tasks_provider.dart';

class EditTaskScreen extends StatelessWidget {
  final titleController = TextEditingController();

  EditTaskScreen({super.key, required this.task});

  late Task task;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context);

    return Column(
      children: [
        const Text("Edit Existing Task"),
        TextFormField(
          controller: titleController..text = task.title,
          decoration: const InputDecoration(
            label: Text("Task Title"),
          ),
        ),
        TextButton(
          onPressed: () {
            provider.editTask(task, titleController.value.text);
            titleController.clear();
            Navigator.pop(context);
          },
          child: const Text("Save Changes"),
        )
      ],
    );
  }
}
