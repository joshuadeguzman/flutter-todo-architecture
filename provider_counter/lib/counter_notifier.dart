import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  get counter => _counter;

  void updateCounter(int currentCounter) {
    _counter = currentCounter;
    notifyListeners();
  }
}