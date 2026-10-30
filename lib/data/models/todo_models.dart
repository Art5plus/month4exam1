class TodoModels {
  final int id;
  final String todo;
  final bool completed;
  final int iserId;

  TodoModels({
    required this.id,
    required this.todo,
    required this.completed,
    required this.iserId,
  });

  factory TodoModels.fromJson(Map<String, dynamic> json) {
    return TodoModels(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      iserId: json['userId'],
    );
  }
}
