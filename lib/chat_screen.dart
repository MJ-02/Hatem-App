import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled2/chat_message.dart';
import 'package:untitled2/main.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:http/http.dart' as http;





class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  Future<String> sendPostRequest() async {
    final String url = 'http://192.168.1.8:5000/api'; // Replace with your server's IP address

    try {
      print('test');
      final response = await http.post(Uri.parse(url));
      print('test0');

      if (response.statusCode == 200) {
        print('test1');
        print(response.body);
        return response.body; // Return the response body
      } else {
        print('Error: ${response.statusCode}');
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      print('test3');
      print('Exception: $e');
      return 'Exception: $e';
    }
  }


  void _sendMessage(){
    ChatMessage _message = ChatMessage(text: _controller.text , sender: "user");

    setState(() {
      _messages.insert(0, _message);
    });
    sendPostRequest();
    _controller.clear();
  }

  Widget _buildTextComposer(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration.collapsed(hintText: "اسأل دمدوم"),
            ),
          ),
          IconButton(
              onPressed: () {_sendMessage();},
              icon: const Icon(Icons.send)
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(
        //   onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>MyApp())),
        // ),
        backgroundColor: Colors.deepPurple,
        title: Text("دمدوم"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                itemCount: _messages.length,
                itemBuilder: (context, index){
                  return _messages[index];
                },
              )
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      )
    );
  }
}
