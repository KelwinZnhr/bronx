import 'package:bronx/entities/course.dart';
import 'package:bronx/service/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

late IsarService isarDb;
late TextEditingController controller;

class CourseShowcase extends StatefulWidget {
  const CourseShowcase({Key? key}) : super(key: key);

  @override
  State<CourseShowcase> createState() => _CourseShowcaseState();
}

class _CourseShowcaseState extends State<CourseShowcase> {
  @override
  void initState() {
    isarDb = IsarService();
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courses Showcase")),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 500,
            child: StreamBuilder<List<Course>>(
              stream: isarDb.listenToCourses(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                      Visibility(
                          visible: snapshot.hasData,
                          child: Text(snapshot.data.toString()))
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  } else if (snapshot.hasData) {
                    var dataStream = snapshot.data!;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: snapshot.data!.length,
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
                                  dataStream[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ).animate().fadeIn();
                        //
                      },
                    );
                  }
                } else {
                  return const Text("there is no data");
                }
                return const Text("No data");
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return Dialog(
                              child: SizedBox(
                                height: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "Enter course name",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextField(
                                        controller: controller,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            Course course = Course();
                                            course.title = controller.text;
                                            await isarDb.saveCourse(course);
                                            controller.clear();
                                            if (!mounted) return;
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Save course"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }));
                    },
                    child: const Text("Add courses")),
              )
            ],
          )
        ]),
      ),
    );
  }
}
