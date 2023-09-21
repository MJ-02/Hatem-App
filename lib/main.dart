import 'package:flutter/material.dart';
import 'package:untitled2/navBar.dart';
import 'package:untitled2/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/PDFviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const PDFviewer();
  }
}



// return Scaffold(
    //   drawer: const NavBar(),
    //   appBar: AppBar(
    //     title: const Text(
    //       "دمدوم",
    //
    // ),
    //     backgroundColor: Colors.green,
    //   ),
    //   body: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //
    //
    //       Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Center(
    //           child: Container(
    //             width: 300,
    //             height: 150,
    //             decoration: BoxDecoration(
    //                 borderRadius: const BorderRadius.all(Radius.circular(42)),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.deepOrange.shade400,
    //                     offset: const Offset(0, 20),
    //                     blurRadius: 30,
    //                     spreadRadius: -5,
    //                   ),
    //                 ],
    //                 gradient: LinearGradient(
    //                     begin: Alignment.topLeft,
    //                     end: Alignment.bottomCenter,
    //                     colors: [
    //                       Colors.deepOrange.shade200,
    //                       Colors.deepOrange.shade300,
    //                       Colors.deepOrange.shade500,
    //                       Colors.deepOrange.shade500,
    //                     ],
    //                     stops: const [
    //                       0.1,
    //                       0.3,
    //                       0.9,
    //                       1.0
    //                     ])),
    //             child: GestureDetector(
    //               child: const Center(
    //                 child:
    //                   Text(
    //                   "اسأل دمدوم",
    //                   style:TextStyle (
    //                     fontSize: 20.0,
    //                     shadows: [
    //                       Shadow(
    //                         blurRadius:10.0,  // shadow blur
    //                         color: Colors.white10, // shadow color
    //                         offset: Offset(2.0,2.0), // how much shadow will be shown
    //                       ),
    //                     ],
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                    ),
    //                   ),
    //                 ),
    //                 onTap: (){
    //                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>ChatScreen()));
    //                 },
    //           ),
    //           ),
    //         ),
    //       ),
    //
    //
    //       Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Center(
    //           child: Container(
    //             width: 300,
    //             height: 150,
    //             decoration: BoxDecoration(
    //                 borderRadius: const BorderRadius.all(Radius.circular(42)),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.deepPurple.shade400,
    //                     offset: const Offset(0, 20),
    //                     blurRadius: 30,
    //                     spreadRadius: -5,
    //                   ),
    //                 ],
    //                 gradient: LinearGradient(
    //                     begin: Alignment.topLeft,
    //                     end: Alignment.bottomCenter,
    //                     colors: [
    //                       Colors.deepPurple.shade200,
    //                       Colors.deepPurple.shade300,
    //                       Colors.deepPurple.shade500,
    //                       Colors.deepPurple.shade500,
    //                     ],
    //                     stops: const [
    //                       0.1,
    //                       0.3,
    //                       0.9,
    //                       1.0
    //                     ])),
    //             child: GestureDetector(
    //               child: const Center(
    //                 child:
    //                 Text(
    //                   "أفتح ملف",
    //                   style:TextStyle (
    //                     fontSize: 20.0,
    //                     shadows: [
    //                       Shadow(
    //                         blurRadius:10.0,  // shadow blur
    //                         color: Colors.white10, // shadow color
    //                         offset: Offset(2.0,2.0), // how much shadow will be shown
    //                       ),
    //                     ],
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //               onTap: (){
    //                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>PDFviewer()));
    //               },
    //             ),
    //           ),
    //         ),
    //       ),
    //
    //
    //     ],
    //   )
    //
    //
    // );
