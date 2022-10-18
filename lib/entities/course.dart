import 'package:bronx/entities/student.dart';
import 'package:bronx/entities/teacher.dart';
import 'package:isar/isar.dart';

part 'course.g.dart';

@Collection()
class Course {
  Id id = Isar.autoIncrement;
  late String title;

  @Backlink(to: "course")
  final teacher = IsarLink<Teacher>();

  @Backlink(to: "courses")
  final students = IsarLinks<Student>();
}
