import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_screen.dart';
import 'package:path_provider/path_provider.dart';

class PostsScreen extends StatefulWidget {
  String? userId;
  PostsScreen(this.userId);
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          //it is for Posts
          Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200,
                    width: 220,
                    child: Card(
                      elevation: 40,
                      color: Color(0xFF111328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Topic',
                            style: GoogleFonts.lobster(
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: Divider(
                              color: Colors.white30,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            child: TextField(
                              //textAlign: TextAlign.center,
                              readOnly: true,
                              obscureText: true,
                              onChanged: (value) {},

                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                //focusColor: Colors.amber,
                                fillColor: Colors.transparent,
                                filled: true,
                                hintMaxLines: 4,

                                hintText:
                                    'You are going to a park and you are seeing two bird on the branches of Tree. You have to draw this',
                                hintStyle: GoogleFonts.anton(
                                  textStyle: TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF111328)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(widget.userId)
                .collection("images")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No image uploaded"),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //1st Row

                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 8, 16),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('images/gyan.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Gyan456',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 180,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                      ),

                      //2nd Row

                      Flexible(
                        child: Image.network(
                            snapshot.data!.docs[index]['downloadUrl']),
                        fit: FlexFit.loose,
                      ),

                      //3rd Row

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Icon(FontAwesomeIcons.comment),
                                SizedBox(
                                  width: 16,
                                ),
                                Icon(FontAwesomeIcons.paperPlane),
                              ],
                            ),
                            Icon(FontAwesomeIcons.bookmark),
                          ],
                        ),
                      ),

                      //4th Row

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Liked by 58682902 peoples',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      //5th Row
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/gyan.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Add a comment...'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //6th Row

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '1 hour ago',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Divider(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
