import 'dart:convert';

import 'package:untitled2/document_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/reader_screen.dart';
import 'package:untitled2/navBar.dart';
import 'package:untitled2/chat_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_emoji/flutter_emoji.dart';

Document D = Document("a", "a", "a", 12);

class Selecter extends StatefulWidget {
  const Selecter({super.key});

  @override
  State<Selecter> createState() => _SelecterState();
}

class _SelecterState extends State<Selecter> {
  Future<String> sendPostRequest(String message) async {
    const String url = 'https://w35gd3xl-5000.uks1.devtunnels.ms/choose_doc';

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "subject": message,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return response.body; // Return the response body
      } else {
        print('Error: ${response.statusCode}');
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Exception: $e';
    }
  }

  void sendmessage(String? name) {
    sendPostRequest(name!);
  }

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();

    var books = parser.emojify(":book:");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Row(
          children: [
            Spacer(), // Add Spacer to push the title to the right
            Text("حاتم"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "$books كتبي",
                  style: GoogleFonts.roboto(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: Document.doc_list
                    .map((doc) => ListTile(
                          onTap: () {
                            D.doc_title = doc.doc_title;
                            D.doc_date = doc.doc_date;
                            D.doc_loco = doc.doc_loco;
                            D.page_num = doc.page_num;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReaderScreen(doc),
                              ),
                            );
                            if (D.doc_title == "تاريخ الاردن") {
                              sendmessage("history");
                            } else {
                              sendmessage("biology");
                            }
                          },
                          title: Text(
                            doc.doc_title!,
                            style: GoogleFonts.nunito(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text("${doc.page_num} Pages"),
                          trailing: Text(
                            doc.doc_date!,
                            style: GoogleFonts.nunito(color: Colors.grey),
                          ),
                          leading: const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                            size: 32.0,
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
