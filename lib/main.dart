import 'package:database/database_repo.dart';
import 'package:database/dynamic_data.dart';
import 'package:flutter/material.dart';

import 'modelclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: '',)
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<modelclass> studentList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseRepo.insertRecord;
    // DatabaseRepo.getRecords().then((value) {
    //   setState(() {
    //     studentList = value;
    //   });
    // });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount:1,
                    itemBuilder: (context, index) {
                       // return Center(child: Text(studentList[index].name!));
                      return DataTable(columns: [
                        DataColumn(label:Text('id',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),),
                        DataColumn(label:Text('name',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white))),
                        DataColumn(label:Text('age',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white))),
                        DataColumn(label:Text('course',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white))),
                      ], rows:[
                        ...empList.map((e) => DataRow(cells:[
                          DataCell(Text(e.id.toString(),style: TextStyle(color: Colors.white,fontSize: 20),)),
                          DataCell(Text(e.name!,style: TextStyle(color: Colors.white,fontSize: 20),)),
                          DataCell(Text(e.age.toString(),style: TextStyle(color: Colors.white,fontSize: 20),)),
                          DataCell(Text(e.address!,style: TextStyle(color: Colors.white,fontSize: 20),),)
                          ])).toList()

                      ]);
                    },);
                }
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await DatabaseRepo.insertRecord();
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => DynamicData(),));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// import 'package:database/database_repo.dart';
// import 'package:database/dynamic_data.dart';
// import 'package:flutter/material.dart';
//
// import 'modelclass.dart'; // Ensure this file exists and contains the model class.
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Student Records'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Future<List<modelclass>> studentListFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     studentListFuture =  DatabaseRepos().getRecordes(); // Ensure this method exists and returns a Future<List<ModelClass>>.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: FutureBuilder<List<modelclass>>(
//           future: studentListFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Text('No records found.');
//             }
//
//             final studentList = snapshot.data!;
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(
//                     label: Text(
//                       'ID',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Name',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Age',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Course',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ],
//                 rows: studentList
//                     .map(
//                       (e) => DataRow(
//                     cells: [
//                       DataCell(Text(
//                         e.id.toString(),
//                         style: const TextStyle(color: Colors.white),
//                       )),
//                       DataCell(Text(
//                         e.name!,
//                         style: const TextStyle(color: Colors.white),
//                       )),
//                       DataCell(Text(
//                         e.age.toString(),
//                         style: const TextStyle(color: Colors.white),
//                       )),
//                       DataCell(Text(
//                         e.course!,
//                         style: const TextStyle(color: Colors.white),
//                       )),
//                     ],
//                   ),
//                 )
//                     .toList(),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => DynamicData(), // Ensure this screen exists.
//             ),
//           );
//         },
//         tooltip: 'Add Record',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
