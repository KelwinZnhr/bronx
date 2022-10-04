//import 'package:bronx/calculette.dart';
import 'package:bronx/wordle_clone.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bronx',
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color.fromARGB(255, 123, 255, 0)),
      home: const WordleClone(),
    );
  }
}
