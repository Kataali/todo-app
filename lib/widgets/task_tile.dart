import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskTitle,
    required this.date,
    this.isChecked = false,
    required this.completedCallBack,
    required this.deleteTaskFunc,
  });
  final String taskTitle;
  final DateTime date;
  bool isChecked;
  final Function() completedCallBack;
  final Function() deleteTaskFunc;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;

    return ListTile(
      tileColor: Colors.white,
      title: Text(
        taskTitle,
        // style: const TextStyle(color: Colors.black),
      ),
      leading: Checkbox(
        value: isChecked,
        onChanged: (value) {
          completedCallBack();
        },
        shape: const CircleBorder(),
      ),
      trailing: SizedBox(
        width: 85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_outlined),
            ),
            IconButton(
              onPressed: () {
                deleteTaskFunc();
              },
              icon: const Icon(Icons.delete_outlined),
            ),
          ],
        ),
      ),
      subtitle: Text('$date'),
      // style: ListTileStyle.list,
      // contentPadding: EdgeInsets.symmetric(vertical: 5),
      minVerticalPadding: 15,
      isThreeLine: true,
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      // enabled: true,
      // selectedColor: Colors.whi,
      // selectedTileColor: Colors.blue,
      // selected: true,
    );
  }
}
