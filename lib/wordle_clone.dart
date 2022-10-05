import 'dart:developer';
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
  compareTo = able[Random().nextInt(able.length)];
  wording = "";
  count = 6;
}

String word = "";
late TextEditingController controller;
int count = 6;

String wording = "";

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              generateWord();
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
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
          Text(
            compareTo,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: SizedBox(
                    width: 400,
                    height: 480,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            color: Colors.grey,
                            child: const Center(
                              child: Text(
                                "",
                                style: TextStyle(
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
              ).animate().fadeIn(
                    duration: const Duration(milliseconds: 1000),
                  ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: SizedBox(
                    width: 400,
                    height: 480,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemCount: wording.length,
                      itemBuilder: (BuildContext context, int index) {
                        Color verify() {
                          if (word.length == 5 &&
                              compareTo.contains(wording[index]) &&
                              wording[index] == compareTo[index % 5]) {
                            return Colors.green;
                          } else if (word.length == 5 &&
                              compareTo.contains(wording[index])) {
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
                                wording.isNotEmpty
                                    ? wording[index].toUpperCase()
                                    : "",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ).animate().fadeIn(
                              duration: const Duration(milliseconds: 1000),
                            );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                enabled: count > 0 ? true : false,
                controller: controller,
                maxLength: 5,
                onSubmitted: ((value) {
                  if (value.length == 5 && all.contains(value)) {
                    setState(() {
                      word = controller.text;
                      wording += controller.text;

                      count--;
                      controller.clear();
                    });
                  } else if (value.length == 5 &&
                      all.contains(value) &&
                      value == compareTo) {
                    setState(() {
                      word = controller.text;
                      wording += controller.text;

                      count--;
                      controller.clear();
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Dialog(
                          child: Text("You found it, good job"),
                        );
                      },
                    );
                    count = 0;
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
