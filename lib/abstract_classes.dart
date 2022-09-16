import 'package:flutter/material.dart';

import 'package:flutter_application_1/extensions.dart';

abstract class CanRun {
  void run() {
    "Running . . .".log();
  }
}

abstract class CanWalk {
  void walk() {
    'Waling . . .'.log();
  }
}

class Cat with CanRun,CanWalk {
  @override
  void run() {
    super.run();
    "Cat is running".log();
  }
}

class Dog with CanRun,CanWalk {
  @override
  void run() {
    super.run();
    "Dog is running".log();
  }
}

enum Type { cat, dog }
