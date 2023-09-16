import 'package:untitled2/document_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/reader_screen.dart';
import 'package:untitled2/navBar.dart';
import 'package:untitled2/chat_screen.dart';
import 'package:untitled2/PDFselecter.dart';


class PDFviewer extends StatefulWidget {
  const PDFviewer({super.key});

  @override
  State<PDFviewer> createState() => _PDFviewerState();
}

class _PDFviewerState extends State<PDFviewer> {
  final List<Widget> pages = [Selecter(), ChatScreen()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const NavBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   leading: IconButton(onPressed: (){}, icon: Icon((Icons.menu))),
      //   title: const Text("دمدوم"),
      // ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "دراسة"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "اٍسأل"
          )
        ],
        currentIndex: selectedIndex,
        onTap: (int index){setState(() {
          selectedIndex = index;
        });},
      ),
    );
  }
}

