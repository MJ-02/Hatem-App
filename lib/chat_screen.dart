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
  int index = 0;
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> sendPostRequest(String message) async {
    const String url = 'https://w35gd3xl-5000.uks1.devtunnels.ms/answer_query';

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> body = {
        "prompt": message,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("succesful connection\n result: ${response.body}");
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

  // Add this method to your _ChatScreenState class in ChatScreen
  void _handleServerResponse(Map<String, dynamic> jsonResponse) {
    String response = jsonResponse["message"];
    ChatMessage _message =
        ChatMessage(text: response, sender: "bot", isBot: true);

    setState(() {
      _messages.insert(index, _message);
      index++;
    });
  }

// Modify your _sendMessage method to handle the server response
  void _sendMessage() async {
    if (_controller.text == "" || _controller.text.isEmpty) {
      return;
    }
    ChatMessage _message =
        ChatMessage(text: _controller.text, sender: "user", isBot: false);

    setState(() {
      _messages.insert(index, _message);
      index++;
    });

    try {
      final response = await sendPostRequest(_controller.text);
      Map<String, dynamic> jsonResponse = jsonDecode(response);
      _handleServerResponse(jsonResponse);
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              _sendMessage();
              _controller.clear();
            },
            icon: const Icon(Icons.arrow_back), // Use the arrow back icon
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  const InputDecoration.collapsed(hintText: "اسأل حاتم"),
              textAlign: TextAlign.right, // Set text alignment to right
            ),
          ),
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
        backgroundColor: Colors.blue,
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            "دردش مع حاتم",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: false,
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}
