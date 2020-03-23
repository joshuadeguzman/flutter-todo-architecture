// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider_todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(todo.title),
          Text(todo.description),
        ],
      ),
    );
  }
}
