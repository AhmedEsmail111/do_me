class Task {
  bool isDone;
  String taskTitle;
  Task({this.isDone = false, this.taskTitle});
  void toggleDone() {
    isDone = !isDone;
  }
}
