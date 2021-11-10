// ignore_for_file: prefer_const_constructors

// import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Center(child: Text('Chat')),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }else{
                    final messages = snapshot.data!.docs;
                    List<Text> textWidgets = [];
                    messages.forEach((element) {
                      final messageText = element['text'];
                      final messageSender = element['sender'];

                      final textWidget = Text(
                        '$messageSender $messageText',
                        style: TextStyle(color: Colors.white),
                      );
                      textWidgets.add(textWidget);
                    });

                    print(textWidgets);
                    return Column(
                      children: textWidgets,
                    );
                  }
                  },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _messageController,
                decoration: InputDecoration(
                  suffixIcon: Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          print(_messageController);
                        });

                        _firestore.collection('messages').add({
                          'text': _messageController.text,
                          'sender': loggedInUser.email,
                        });
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Type Here...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
