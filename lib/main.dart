import 'dart:io';
import 'dart:isolate';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions.dart';
import 'package:flutter_application_1/mixin_class.dart';
import 'package:flutter_application_1/person.dart';

Future<void> testIt() async {
  final people = await GetPeople().getString();
  people.log();
}

Future<Iterable<Person>> getPersons() async {
  final rp = ReceivePort();
  await Isolate.spawn(_getPersons, rp.sendPort);
  return await rp.first;
}

void _getPersons(SendPort port) async {
  const url = 'https://github.com/AliKarimiENT/Dart-course/blob/master/apis/people1.json';
  final persons = await HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((res) => res.transform(utf8.decoder).join())
      .then((jsonString) => json.decode(jsonString) as List<dynamic>)
      .then(
        (json) => json.map(
          (map) => Person.fromJson(map),
        ),
      );
  // port.send(persons);
  Isolate.exit(
    port,
    persons,
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    'testit log function'.log();
    // testIt();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart course'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () async {
                  final persons = await getPersons();
                  persons.log();
                },
                child: const Text('Press me'))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
