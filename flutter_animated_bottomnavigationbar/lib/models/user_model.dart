import 'package:flutter_animated_bottomnavigationbar/models/course_model.dart';

class UserModel {
  final String name;
  final String birthDate;
  final String idNumber;
  final List<CourseModel> course;

  UserModel({this.name, this.birthDate, this.idNumber, this.course});
}
