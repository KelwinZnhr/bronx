import 'package:bronx/entities/course.dart';
import 'package:isar/isar.dart';

part 'student.g.dart';

@Collection()
class Student {
  Id id = Isar.autoIncrement;
  late String name;
  final courses = IsarLinks<Course>();
}
