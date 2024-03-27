import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    super.key,
    required this.taskTitle,
    required this.date,
    this.isChecked = false,
    required this.completedCallBack,
    required this.deleteTaskFunc,
    required this.editTaskFunc,
  });
  final String taskTitle;
  final DateTime date;
  bool isChecked;
  final Function() completedCallBack;
  final Function() deleteTaskFunc;
  final Function() editTaskFunc;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;

    return ListTile(
      // tileColor: Colors.white,
      title: Text(
        taskTitle,
        // style: const TextStyle(color: Colors.black),
      ),
      horizontalTitleGap: 0,
      leading: Checkbox(
        value: isChecked,
        onChanged: (value) {
          completedCallBack();
        },
        shape: const CircleBorder(),
      ),
      minLeadingWidth: 0.0,
      trailing: SizedBox(
        width: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                editTaskFunc();
              },
              child: const Icon(Icons.edit_outlined),
            ),
            InkWell(
              onTap: () {
                deleteTaskFunc();
              },
              child: const Icon(Icons.delete_outlined),
            ),
          ],
        ),
      ),
      subtitle: Text('$date'),
      // style: ListTileStyle.list,
      // contentPadding: EdgeInsets.symmetric(vertical: 5),
      minVerticalPadding: 15,
      // isThreeLine: true,
      shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      // enabled: true,
      // selectedColor: Colors.whi,
      selectedTileColor: Colors.blue,
      // selected: true,
    );
  }
}
