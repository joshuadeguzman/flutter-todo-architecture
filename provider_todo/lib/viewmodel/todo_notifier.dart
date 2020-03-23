import 'package:flutter/material.dart';
import 'package:provider_todo/models/todo.dart';

class TodoNotifier extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}