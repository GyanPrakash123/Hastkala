import 'package:flutter/material.dart';
import 'livechat.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/c2.jfif'),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kristin Watson',
                    style: TextStyle(fontSize: 16),
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      'Active 3m ago',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.local_phone),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: ListView.builder(
                  itemCount: demeChatMessages.length,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: demeChatMessages[index].isSender
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!demeChatMessages[index].isSender)
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage('images/c4.jpg'),
                        ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade400.withOpacity(
                              demeChatMessages[index].isSender ? 1 : .18),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          demeChatMessages[index].text,
                          style: TextStyle(
                              color: demeChatMessages[index].isSender
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFF111328),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 32,
                      color: Colors.white10),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Icon(Icons.mic, color: Colors.greenAccent.shade400),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF111328).withOpacity(1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.sentiment_satisfied_alt_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type message',
                                  //border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.attach_file,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
