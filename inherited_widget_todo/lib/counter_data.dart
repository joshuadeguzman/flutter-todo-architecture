// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}

class CounterData extends InheritedWidget {
  final CounterNotifier counterModel;

  CounterData({
    Key key,
    this.counterModel,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CounterData oldWidget) {
    return counterModel != oldWidget.counterModel;
  }

  static CounterData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterData>();
  }
}
