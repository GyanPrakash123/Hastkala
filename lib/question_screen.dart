import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hastkala/posts.dart';
import 'posts.dart';

//Image picker fo picking the image
//Firebase storage for uploading the image to firebasestorage
//and,cloud firestore for saving the url for uploaded image to our application
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionScreen extends StatefulWidget {
  //isko use krne ke liye register wla problem shortout krke dekhna hai
  String? userId;
  QuestionScreen(this.userId);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  //some initialisation code
  File? _image;
  String? downloadUrl;
  final imagePicker = ImagePicker();

//image picker Method
  Future imagePickerMethod() async {
    //picking the file
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar(
          "No file selected",
          Duration(milliseconds: 400),
        );
      }
    });
  }

//uploading the image, then getting the download Url and then
//adding that download Url to our cloudfirestore
  Future UploadImage() async {
    final postId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}/images")
        .child("post_$postId");
    await ref.putFile(_image!);
    downloadUrl = await ref.getDownloadURL();

    //uploading to cloud firestore
    await firebaseFirestore
        .collection("users")
        .doc(widget.userId)
        .collection('images')
        .add({'downloadUrl': downloadUrl}).whenComplete(() =>
            showSnackBar("Image Uploaded Successfully", Duration(seconds: 2)));
  }

  //snackbar for showing errors
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 20, right: 10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'You are going in a village. And you are watching a deer in field.',
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'You have to draw this imagination.',
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            MaterialButton(
              onPressed: () {
                imagePickerMethod();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 280,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Expanded(
                      child: _image == null
                          ? Center(
                              child: Text('Select hand drawing'),
                            )
                          : Image.file(_image!),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                //upload image only when the image has some values
                if (_image != null) {
                  UploadImage();
                } else {
                  showSnackBar(
                    "Select Image First",
                    Duration(milliseconds: 400),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                    child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
