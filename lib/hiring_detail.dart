import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HiringDetail extends StatefulWidget {
  const HiringDetail({Key? key}) : super(key: key);

  @override
  _HiringDetailState createState() => _HiringDetailState();
}

class _HiringDetailState extends State<HiringDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Write your all details about your Project',
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter your description..',
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Start Rating',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter your starting rating',
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Closed Date',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter your closing date...',
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Price',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: 'Enter your price..',
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 10,
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
