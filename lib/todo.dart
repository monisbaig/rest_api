class Todo {
  String? title;
  String? description;
  String? category;
  int? timestamp;
  int? priority;
  bool? inCompleted;
  String? id;

  Todo({
    this.title,
    this.description,
    this.category,
    this.timestamp,
    this.priority,
    this.inCompleted,
    this.id,
  });

  static List<Todo> fromJasonList(List<dynamic> jason) {
    List<Todo> todos = [];
    for (var jasonTodo in jason) {
      var jasonTodoMap = jasonTodo as Map<String, dynamic>;
      todos.add(Todo(
        title: jasonTodoMap['title'],
        description: jasonTodoMap['description'],
        category: jasonTodoMap['category'],
        timestamp: jasonTodoMap['timestamp'],
        priority: jasonTodoMap['priority'],
        inCompleted: jasonTodoMap['inCompleted'],
        id: jasonTodoMap['id'],
      ));
    }
    return todos;
  }
}
