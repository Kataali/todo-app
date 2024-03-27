import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/app_theme.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksProvider>(
      create: (BuildContext context) => TasksProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(),
        // home: const MyHomePage(title: 'TaskPlus'),
        home: const TasksScreen(),
        routes: {
          "addTaskScreen": (context) => AddTaskScreen(),
          // "editTaskScreen": (context) => EditTaskScreen(),
          "homeScreen": (context) => const MyHomePage(title: "Task Plus"),
          "tasksScreen": (context) => const TasksScreen(),
        },
      ),
    );
  }
}
