import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:untitled2/document_model.dart';
import 'package:untitled2/chat_screen.dart';
import 'package:untitled2/PDFselecter.dart';
import 'package:untitled2/actualReader.dart';

class ReaderScreen extends StatefulWidget {
  ReaderScreen(this.doc, {super.key});

  Document doc;

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  final List<Widget> pages = [actualReader(D), const ChatScreen()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Text(widget.doc.doc_title!),
      // ),
      // body: Container(
      //   child: SfPdfViewer.asset(widget.doc.doc_loco!),
      //   //SfPdfViewer.network(widget.doc.doc_url!),
      // ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "دراسة"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "اٍسأل")
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
