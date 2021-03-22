class Task {
  final id;
  int isDone;
  String taskTitle;
  Task({this.isDone = 0, required this.taskTitle, this.id});
  void toggleDone() {
    isDone == 0 ? isDone = 1 : isDone = 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'taskTitle': this.taskTitle,
      'isDone': this.isDone,
    };
  }
}
