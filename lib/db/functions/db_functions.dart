import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedemo/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async
{
  
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  print("New added : ");
  print(studentListNotifier.value);
}

Future<void> getAllStudents() async
{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
  print("Initial loading :");
  print(studentListNotifier.value);
}

Future<void> deleteStudent(int id) async{
final studentDB = await Hive.openBox<StudentModel>('student_db');
await studentDB.delete(id);
getAllStudents();
}
