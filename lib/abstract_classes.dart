import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions.dart';

abstract class CanRun {
  String get type {
    if (this is Cat) {
      return 'Type is Cat';
    } else if (this is Dog) {
      return 'Type is Dog';
    } else {
      return 'Something else';
    }
  }

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Cat with CanRun {
  @override
  void run() {
    super.run();
    "Cat is running".log();
  }
}

class Dog with CanRun {
  @override
  void run() {
    super.run();
    "Dog is running".log();
  }
}