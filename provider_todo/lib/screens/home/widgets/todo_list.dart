// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider_todo/models/todo.dart';
import 'package:provider_todo/screens/home/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todos.length > 0) {
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(todo: todos[index]);
        },
      );
    }
    return Center(
      child: Text("No items found."),
    );
  }
}
