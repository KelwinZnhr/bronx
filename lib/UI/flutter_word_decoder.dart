import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myListWord = Provider((ref) => all);

late TextEditingController controller;

List<String> foundWord = [];

int selectedNumber = 3;

class WordDecoder extends ConsumerStatefulWidget {
  const WordDecoder({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WordDecoderState();
}

class _WordDecoderState extends ConsumerState<WordDecoder> {
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final seekHere = ref.watch(myListWord);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anagram Finder",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: foundWord.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.orange,
                        height: 20,
                        width: 50,
                        child: Center(
                          child: Text(
                            foundWord[index].toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ).animate().fadeIn();
                },
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                maxLength: selectedNumber,
                controller: controller,
                onSubmitted: (value) {
                  if (value.length == selectedNumber) {
                    search(value);
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "The length of entered character should match the selected number")));
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 3; i <= 6; i++)
                    ElevatedButton(
                      child: Text("$i",
                          style: TextStyle(
                              color: i == selectedNumber
                                  ? Colors.green
                                  : Colors.white)),
                      onPressed: () {
                        selectedNumber = i;
                        setState(() {});
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  search(String value) {
    List<String> found = value.split('');
    List<String> toCompare =
        all.where((element) => element.length == selectedNumber).toList();

    foundWord.clear();
    for (String word in toCompare) {
      switch (selectedNumber) {
        case 3:
          if (word.contains(found[0]) &
              word.contains(found[1]) &
              word.contains(found[2])) {
            foundWord.add(word);
          }
          break;
        case 4:
          if (word.contains(found[0]) &
              word.contains(found[1]) &
              word.contains(found[2]) &
              word.contains(found[3])) {
            foundWord.add(word);
          }
          break;
        case 5:
          if (word.contains(found[0]) &
              word.contains(found[1]) &
              word.contains(found[2]) &
              word.contains(found[3]) &
              word.contains(found[4])) {
            foundWord.add(word);
          }
          break;
        case 6:
          if (word.contains(found[0]) &
              word.contains(found[1]) &
              word.contains(found[2]) &
              word.contains(found[3]) &
              word.contains(found[4]) &
              word.contains(found[5])) {
            foundWord.add(word);
          }
          break;
        default:
          foundWord.add("No matching word");
      }
    }
  }
}
