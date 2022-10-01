import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

List<String> able = [];
late String compareTo;

List<String> data = all;
void generateWord() async {
  for (int i = 0; i < data.length; i++) {
    if (data[i].length == 5) {
      able.add(data[i]);
    }
  }
}

String word = "";
late TextEditingController controller;

class WordleClone extends StatefulWidget {
  const WordleClone({super.key});

  @override
  State<WordleClone> createState() => _WordleCloneState();
}

class _WordleCloneState extends State<WordleClone> {
  @override
  void initState() {
    controller = TextEditingController();
    generateWord();
    compareTo = able[Random().nextInt(able.length)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        title: const Text(
          "Wordle",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Text(
          //   compareTo,
          //   style: const TextStyle(
          //     fontSize: 32,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    Color verify() {
                      if (word.length == 5 &&
                          compareTo.contains(word[index % 5]) &&
                          word[index % 5] == compareTo[index % 5]) {
                        return Colors.green;
                      } else if (word.length == 5 &&
                          compareTo.contains(word[index % 5])) {
                        return Colors.yellow;
                      } else if (word.length == 5) {
                        return Colors.black;
                      } else {
                        return Colors.grey;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: verify(),
                        child: Center(
                          child: Text(
                            word.length == 5
                                ? word[index % 5].toUpperCase()
                                : "",
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: controller,
                maxLength: 5,
                onSubmitted: ((value) {
                  if (value.length == 5 && able.contains(value)) {
                    setState(() {
                      word = controller.text;
                    });
                  } else if (!able.contains(value)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: const Text(
                          "Word must exist in the dictionary",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ).animate().shakeX(
                              duration: const Duration(milliseconds: 1000),
                            ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: const Text(
                          "You must enter a word of 5 character",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ).animate().shakeX(
                              duration: const Duration(milliseconds: 1000),
                            ),
                      ),
                    );
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
