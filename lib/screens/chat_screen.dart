import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/logger.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? _firebaseUser;
  String? message;
  final textEditingController= TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    try {
      _firebaseUser = _auth.currentUser;
      log('Email:${_firebaseUser?.email}');
    } catch (e) {
      log(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        log(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                messageStream();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageListBuilder(firestore: _firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      try {
                        _firestore.collection('messages').add(
                            {'text': message, 'sender': _firebaseUser?.email});
                      } catch (e) {}
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageListBuilder extends StatelessWidget {
  const MessageListBuilder({
    super.key,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Expanded(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs
                  .map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        title: Text(data['text']),
                        subtitle: Text(data['sender']),
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blueAccent), //the outline color
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                    );
                  })
                  .toList()
                  .cast()),
        );

        // return ListView(
        //   children: snapshot.data?.docs?.map((messages) =>
        //   messages
        //   for (var message in messages) {
        //       final messageObj =
        //           message.data()! as Map<String, dynamic>;
        //       return ListTile(
        //         title: Text(messageObj['text']),
        //         subtitle: Text(messageObj['sender']),
        //       );
        //     }
        //   ).toList().cast();

        // );
      },
      stream: _firestore.collection('messages').snapshots(),
    );
  }
}
