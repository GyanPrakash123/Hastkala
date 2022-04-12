import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 15, right: 16),
        child: ListView(
          children: [
            Text(
              'Edit',
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.lightBlueAccent.withOpacity(0.1),
                          offset: Offset(0, 10),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/gyan.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        color: Colors.lightBlueAccent,
                      ),
                      //color: Colors.lightBlueAccent,
                      child: InkWell(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Column(children: [
                      Text(
                        'Posts',
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                      Center(
                        child: Text(
                          '23',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ]),
                  ),
                  Center(
                    child: Column(children: [
                      Text(
                        'Follower',
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                      Center(
                        child: Text(
                          '10000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ]),
                  ),
                  Center(
                    child: Column(children: [
                      Text(
                        'Following',
                        style: GoogleFonts.anton(
                          textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                      Center(
                        child: Text(
                          '10',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: 220,
                color: Colors.white10,
                child: Column(
                  children: [
                    Text(
                      'About',
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.teal.shade100,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Divider(
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      //textAlign: TextAlign.center,
                      readOnly: true,
                      obscureText: true,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: true,
                        hintMaxLines: 3,
                        hintText:
                            'I have a 5 star on HastKala. I also got a 1st Rank in contest.',
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
