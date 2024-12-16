// import 'package:database/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'database_repo.dart';
// import 'modelclass.dart';
// TextEditingController idController = TextEditingController();
// TextEditingController nameController = TextEditingController();
// TextEditingController ageController = TextEditingController();
// TextEditingController addressController = TextEditingController();
// List<emp_Model> empList = [];
// class Dynamic_data extends StatefulWidget {
//   const Dynamic_data({super.key});
//
//   @override
//   State<Dynamic_data> createState() => _Dynamic_dataState();
// }
//
// class _Dynamic_dataState extends State<Dynamic_data> {
// @override
//   void initState() {
//     // TODO: implement initState
//   DatabaseRepo.insertRecord();
//   DatabaseRepo.getRecordes().then((value) {
//     setState(() {
//       empList = value;
//     });
//   });
//     super.initState();
//   }
//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('help'),
//       ),
//       body: Column(
//         children: [
//           Form(
//             key:formkey,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: idController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "enter grid";
//                       }
//                     },
//                     maxLength: 10,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(CupertinoIcons.info, size: 25),
//                         hintText: 'enter id',
//                         //enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2)),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 2, style: BorderStyle.solid))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller:nameController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter name";
//                       }
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(CupertinoIcons.person, size: 25),
//                         hintText: 'Full Name',
//                         // enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2)),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 2, style: BorderStyle.solid))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: ageController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "age required";
//                       }
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon:
//                         Icon(CupertinoIcons.arrow_3_trianglepath, size: 20),
//                         hintText: 'Age',
//                         // enabledBorder:OutlineInputBorder(borderSide: BorderSide(width: 2)),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 2, style: BorderStyle.solid))),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: addressController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "address Required";
//                       }
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon:
//                         Icon(CupertinoIcons.chat_bubble_text, size: 20),
//                         hintText: 'Address',
//                         // enabledBorder:OutlineInputBorder(borderSide: BorderSide(width: 2)),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 2, style: BorderStyle.solid))),
//                   ),
//                 ),
//
//
//                 OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                     ),
//                     onPressed: () async {
//                       formkey.currentState!.save();
//
//                       await DatabaseRepo.insertRecord();
//                        await DatabaseRepo.getRecordes();
//                       var snakebar = SnackBar(content: Text('submited Successfully'));
//                       ScaffoldMessenger.of(context).showSnackBar(snakebar);
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: 'title'),));
//                     },
//                     child: Text(
//                       '  SAVE  ',
//                       style: TextStyle(fontSize: 18),
//                     ))
//               ],
//             ),
//           ),
//
//         ],
//       ),
//
//     );
//
//   }
// }
//
//
// // class DatabaseRepo{
// //
// //   static Future createDB() async{
// //     return await openDatabase('demo.db',
// //       version: 1,onCreate:(db, version) async {
// //         return await createTable(db);
// //       },);
// //   }
// //
// //   static Future createTable(Database db){
// //     return db.execute('create table emp_details(id integer primary key,name Text not null,age integer not null,address Text not null)');
// //   }
// //
// //   static Future insertRecord() async {
// //     Database db = await DatabaseRepo.createDB();
// //     var data = {'id': idController,};
// //   }
// // }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'modelclass.dart';

TextEditingController idController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController addressController = TextEditingController();
List<emp_Model> empList = [];

class DynamicData extends StatefulWidget {
  const DynamicData({super.key});

  @override
  State<DynamicData> createState() => _DynamicDataState();
}

class _DynamicDataState extends State<DynamicData> {
  @override
  void initState() {
    super.initState();
    DatabaseRepo.getRecords().then((value) {
      setState(() {
        empList = value;
      });
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Database'),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                buildTextField(idController, "Enter ID", CupertinoIcons.info, TextInputType.number, "Enter valid ID"),
                buildTextField(nameController, "Full Name", CupertinoIcons.person, TextInputType.text, "Enter valid name"),
                buildTextField(ageController, "Age", CupertinoIcons.arrow_3_trianglepath, TextInputType.number, "Enter valid age"),
                buildTextField(addressController, "Address", CupertinoIcons.chat_bubble_text, TextInputType.text, "Enter valid address"),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      int id = int.parse(idController.text);
                      String name = nameController.text;
                      int age = int.parse(ageController.text);
                      String address = addressController.text;

                      await DatabaseRepo.insertRecord(emp_Model(id: id, name: name, age: age, address: address));

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted Successfully')));

                      setState(() {
                        idController.clear();
                        nameController.clear();
                        ageController.clear();
                        addressController.clear();
                      });

                      empList = await DatabaseRepo.getRecords();
                    }
                  },
                  child: const Text(
                    'SAVE',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: empList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(empList[index].name),
                  subtitle: Text('Age: ${empList[index].age}, Address: ${empList[index].address}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTextField(TextEditingController controller, String hintText, IconData icon, TextInputType type, String errorMsg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMsg;
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 25),
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

 class DatabaseRepo {
  static Future<Database> createDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'demo.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE emp_details(id INTEGER PRIMARY KEY, name TEXT NOT NULL, age INTEGER NOT NULL, address TEXT NOT NULL)');
      },
    );
  }

  static Future<void> insertRecord(emp_Model model) async {
    final db = await createDB();
    await db.insert('emp_details', model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<emp_Model>> getRecords() async {
    final db = await createDB();
    final List<Map<String, dynamic>> maps = await db.query('emp_details');

    return List.generate(
      maps.length,
          (i) => emp_Model(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        address: maps[i]['address'],
      ),
    );
  }
}

class emp_Model {
  final int id;
  final String name;
  final int age;
  final String address;

  emp_Model({required this.id, required this.name, required this.age, required this.address});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age, 'address': address};
  }
}
