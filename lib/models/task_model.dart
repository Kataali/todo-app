class Task {
  final String title;
  bool isDone;
  final String taskCategory;
  final DateTime date = DateTime.now();

  Task({required this.title, this.isDone = false, required this.taskCategory});
}
