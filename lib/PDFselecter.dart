import 'package:untitled2/document_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/reader_screen.dart';
import 'package:untitled2/navBar.dart';
import 'package:untitled2/chat_screen.dart';

Document D = new Document("a" , "a" , "a" , 12);

class Selecter extends StatefulWidget {
  const Selecter({super.key});

  @override
  State<Selecter> createState() => _SelecterState();
}

class _SelecterState extends State<Selecter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        //leading: IconButton(onPressed: (){}, icon: Icon((Icons.menu))),
        title: const Text("دمدوم"),
      ),
      body: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("اختر المادة", style: GoogleFonts.roboto(fontSize: 48.0, fontWeight: FontWeight.bold), ),

                Column(
                  children: Document.doc_list.map((doc) => ListTile(
                    onTap: (){
                      D.doc_title = doc.doc_title;
                      D.doc_date = doc.doc_date;
                      D.doc_loco = doc.doc_loco;
                      D.page_num = doc.page_num;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ReaderScreen(doc)));
                    },
                    title: Text(doc.doc_title!, style: GoogleFonts.nunito(), overflow: TextOverflow.ellipsis,),
                    subtitle: Text("${doc.page_num} Pages"),
                    trailing: Text(doc.doc_date!, style: GoogleFonts.nunito(color: Colors.grey),),
                    leading: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 32.0,),
                  )).toList(
                  ),

                )
              ],
            ),
          )
      ),
    );
  }
}
