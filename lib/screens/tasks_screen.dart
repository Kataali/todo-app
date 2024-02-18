import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          const Text("Future"),
          // Expanded(
          //   child: ListView(
          //     children: [
          //       TaskTile(taskTitle: "Do Groceries", date: DateTime.now()),
          //       TaskTile(taskTitle: "Do homework", date: DateTime.now())
          //     ],
          //   ),
          // )
          Consumer<TasksProvider>(
            builder:
                (BuildContext context, TasksProvider value, Widget? child) {
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskTile(
                      taskTitle: value.tasksList[index].title,
                      date: value.tasksList[index].date,
                      isChecked: value.tasksList[index].isDone,
                      completedCallBack: () {
                        value.isDone(value.tasksList[index]);
                      },
                      deleteTaskFunc: () {
                        value.deleteTask(value.tasksList[index]);
                      },
                    );
                  },
                  itemCount: value.tasksListsLength,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 35,
                      color: Colors.white,
                    );
                  },
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                isDismissible: true,
                context: context,
                builder: (BuildContext context) => AddTaskScreen(),
              );
            },
            child: const Text("Add Task"),
          ),
        ]),
      ),
    );
  }
}
