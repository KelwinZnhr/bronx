import 'package:bronx/UI/calculette.dart';
import 'package:bronx/UI/course_showcase.dart';
import 'package:bronx/UI/desktop_try.dart';
import 'package:bronx/UI/flutter_word_decoder.dart';
import 'package:bronx/UI/wordle_clone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final likedProvider = StateProvider((ref) => false);

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var liked = ref.watch(likedProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("HackTober"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          maxRadius: 24,
                                          backgroundImage:
                                              AssetImage("assets/images/2.jpg"),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Eivor",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text("The Wolf-Kissed"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ref.watch(likedProvider.state).state =
                                            !ref
                                                .watch(likedProvider.state)
                                                .state;
                                      },
                                      icon: liked
                                          ? const Icon(Icons.favorite_border)
                                              .animate()
                                              .shake(
                                                duration: const Duration(
                                                    milliseconds: 2000),
                                              )
                                          : const Icon(Icons.favorite)
                                              .animate()
                                              .scale(
                                                duration: const Duration(
                                                    milliseconds: 2000),
                                              ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child:
                                              Image.asset("assets/images/1.jpg")
                                                  .animate()
                                                  .shimmer(
                                                    duration: const Duration(
                                                        milliseconds: 2000),
                                                  ),
                                        ),
                                      ),
                                      const Positioned(
                                        left: 10,
                                        bottom: 10,
                                        child: RotatedBox(
                                          quarterTurns: 5,
                                          child: Text(
                                            "Yummy",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ).animate().move(),
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)))),
                    onPressed: (() {}),
                    child: const SizedBox(
                      width: 300,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("View More"),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Computer())));
                    },
                    child: const Text("Go to Calculator"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const WordleClone())));
                    },
                    child: const Text("Go to Wordle"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const WordDecoder())));
                    },
                    child: const Text("Go to Anagram Decoder"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CourseShowcase())));
                    },
                    child: const Text("Go to Courses Showcase"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const DeskTry())));
                    },
                    child: const Text("Go to Responsive layout"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
