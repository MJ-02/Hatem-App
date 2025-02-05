// ignore: file_names
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:untitled2/document_model.dart';

class actualReader extends StatefulWidget {
  actualReader(this.doc, {super.key});
  Document doc;

  @override
  State<actualReader> createState() => _actualReaderState();
}

class _actualReaderState extends State<actualReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.doc.doc_title!),
      ),
      body: Container(
        child: SfPdfViewer.asset(widget.doc.doc_loco!),
        //SfPdfViewer.network(widget.doc.doc_url!),
      ),
    );
  }
}
