import 'package:bronx/entities/course.dart';
import 'package:isar/isar.dart';

part 'teacher.g.dart';

@Collection()
class Teacher {
  Id id = Isar.autoIncrement;
  late String name;
  final course = IsarLink<Course>();
}
