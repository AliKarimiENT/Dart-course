import 'package:flutter/material.dart';

import 'package:flutter_application_1/extensions.dart';

abstract class CanRun {
  final Type type;
  CanRun({
    required this.type,
  });

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Cat extends CanRun {
  Cat() : super(type: Type.cat);
  @override
  void run() {
    super.run();
    "Cat is running".log();
  }
}

class Dog extends CanRun {
  Dog() : super(type: Type.dog);
  @override
  void run() {
    super.run();
    "Dog is running".log();
  }
}

enum Type { cat, dog }
