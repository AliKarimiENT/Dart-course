import 'package:flutter_application_1/extensions.dart';

mixin CanRun {
  int get speed;
  void run() {
    'Running at the spped of $speed'.log();
  }
}

class Cat with CanRun {
  @override
  int speed = 10;
  
  
}