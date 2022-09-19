import 'package:flutter_application_1/extensions.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
abstract class Animal {
  const Animal();
}
mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(url).then(
        (resp) => resp
            .transform(
              utf8.decoder,
            )
            .join(),
      );
}

@immutable
class GetPeople with CanMakeGetCall{
  @override
  String get url => 'http://127.0.0.1:5500/lib/poeple.json';
}