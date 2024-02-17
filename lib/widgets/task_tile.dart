import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.taskTitle, required this.date});
  final String taskTitle;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle),
      leading: const Icon(Icons.check_circle),
      trailing: const SizedBox(
        width: 55,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.edit_outlined), Icon(Icons.delete_outlined)]),
      ),
      subtitle: Text('$date'),
      // style: ListTileStyle.list,
      // contentPadding: EdgeInsets.symmetric(vertical: 5),
      minVerticalPadding: 15,
      isThreeLine: true,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      // enabled: true,
      // selectedColor: Colors.whi,
      selectedTileColor: Colors.blue,
      selected: true,
    );
  }
}
