import 'dart:async';


import 'package:database/modelclass.dart';
import 'package:sqflite/sqflite.dart';

import 'dynamic_data.dart';

class DatabaseRepo{

  static Future createDB() async{
    return await openDatabase('demo.db',
    version: 1,onCreate:(db, version) async {
      return await createTable(db);
    },);
  }

  static Future createTable(Database db){
    return db.execute(
        'create table emp_details('
            'id integer primary key,'
            'name Text not null,'
            'age integer not null,'
            'address Text not null)');
  }

  static Future insertRecord() async {
    Database db = await DatabaseRepo.createDB();
    var data = {
      'id':idController.text,
      'name':nameController.text,
      'age':ageController.text,
      'address':addressController.text};
    int id = await db.insert('emp_details', data);
    print(id);
    return id;
  }

  static Future getRecordes() async {
    Database db = await DatabaseRepo.createDB();
    var data = await db.query('emp_details');
    print(data);

    List<emp_Model> empList = [];
    for(var e in data){
      empList.add(emp_Model.fromJson(e));
    }
    return empList;
  }

//   static Future DeleteRecord(int id) async {
//     Database db = await DatabaseRepo.createDB();
//     db.delete('emp_details',where:'id = ?',whereArgs:[id]);
//   }
//
//   static Future updateRecord(String name , String course , int age,int id) async {
//     Database db = await DatabaseRepo.createDB();
//     var data = {'name':3};
//    int id1= await db.update('student',data,where:'id = ?',whereArgs: [id]);
//    print(id1);
//   }
//
//   static Future
 }
//
//   static Future createTable(Database db){
//     return db.execute
//       ('create table student(id integer primary key autoincrement,name Text not null, age integer not null, course Text not null)');
//   }
//
//   static Future insertRecord() async{
//     Database db = await DatabaseRepo.createDB();
//     var data = {'name':'Ram','age':23,'course':'ramayan'};
//     int id = await db.insert('student', data);
//     // print(id);
//     return id;
//   }
//
//   static Future getRecords() async {
//     Database db = await DatabaseRepo.createDB();
//     var data = await db.query('student');
//     print(data);
//
//     List<modelclass> studentList = [];
//     for(var e in data){
//       studentList.add(modelclass.fromJson(e));
//     }
//     return studentList;
//   }
// }