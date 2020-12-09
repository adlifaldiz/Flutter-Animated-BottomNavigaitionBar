import 'package:flutter_animated_bottomnavigationbar/models/course_model.dart';
import 'package:flutter_animated_bottomnavigationbar/models/user_model.dart';

List<CourseModel> courses = [
  _course1,
  _course2,
  _course3,
  _course4,
  _course5,
];

final _course1 = CourseModel(
  courseName: 'Sport',
  courseAccomplished: 3,
  courseMax: 7,
);
final _course2 =
    CourseModel(courseName: 'Math', courseAccomplished: 4, courseMax: 7);
final _course3 =
    CourseModel(courseName: 'Sains', courseAccomplished: 7, courseMax: 7);
final _course4 =
    CourseModel(courseName: 'History', courseAccomplished: 1, courseMax: 7);
final _course5 = CourseModel(
    courseName: 'Extraculiculer', courseAccomplished: 4, courseMax: 7);
final _course6 =
    CourseModel(courseName: 'Practicum', courseAccomplished: 5, courseMax: 7);

final currentUser = UserModel(
    idNumber: '10115006',
    name: 'Han Burg Man',
    birthDate: 'Dec 10, 1996',
    course: [
      _course1,
      _course2,
      _course3,
      _course4,
      _course5,
      _course6,
    ]);
