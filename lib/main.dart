import 'package:bronx/UI/course_showcase.dart';
import 'package:bronx/UI/calculette.dart';
import 'package:bronx/UI/desktop_try.dart';
import 'package:bronx/UI/flutter_word_decoder.dart';
import 'package:bronx/UI/main_screen.dart';
import 'package:bronx/UI/wordle_clone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        brightness: Brightness.light,
        colorSchemeSeed: const Color.fromARGB(255, 123, 255, 0),
      ),
      home: const ProviderScope(
        child: DeskTry(),
      ),
    );
  }
}
