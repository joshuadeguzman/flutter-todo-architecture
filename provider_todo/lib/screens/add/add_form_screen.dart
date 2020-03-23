// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider_todo/models/todo.dart';
import 'package:provider_todo/screens/add/widgets/save_button.dart';
import 'package:provider_todo/screens/home/home_screen.dart';

class AddFormScreen extends StatefulWidget {
  final List<Todo> todos;

  const AddFormScreen({Key key, this.todos}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddFormScreenState();
  }
}

class _AddFormScreenState extends State<AddFormScreen> {
  TextEditingController _titleTextEditingController;
  TextEditingController _descriptionTextEditingController;

  List<Todo> get _todos => widget.todos;

  @override
  void initState() {
    super.initState();
    _titleTextEditingController = TextEditingController();
    _descriptionTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page - Add TODO"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _descriptionTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Description",
                  ),
                ),
                SizedBox(height: 30),
                SaveButton(
                  onPressed: () {
                    if (_titleTextEditingController.text != null &&
                        _descriptionTextEditingController.text != null) {
                      final Todo newTodo = Todo(
                        _titleTextEditingController.text,
                        _descriptionTextEditingController.text,
                      );
                      _todos.add(newTodo);

                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            todos: _todos,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
