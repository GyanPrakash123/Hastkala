import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hastkala/uid.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var confirmPass;

  // ignore: non_constant_identifier_names
  PostDetailtoFirestore() async {
    //Calling our firestore
    //Calling our UserModel
    //sending to firestore;
    //firebase me changes krne ke liye isko call krte hai
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    //iss line se hmm currentuser ka detail lete hai
    User? user = _auth.currentUser;

    UserModel userModel = UserModel(
        uid: user!.uid,
        username: usernameController.text,
        country: countryController.text,
        email: user.email);
/*Firestore instance search karta hai ki kyaa koi users naam ka collection hai nahi hai toh iss naam ka collection create kar do 

Next search karta hai ki kyaa users collection mein koi user.uid value ka koi document hai , nahi hai toh ye value ka document create kar do

Then jab ye document mil jaata hai toh iss document mein wo users data ko add kar do . Jo tumne usersModel mein store kiya hai */
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(
        msg: "Account Created Successfully",
        textColor: Colors.greenAccent.shade400);
    Navigator.pushNamed(context, 'front_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text(
          'Register',
          style: GoogleFonts.abrilFatface(
            textStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Register with any one of the following options',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        elevation: 1000.0,
                        color: Color(0xFF0A0E21),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('images/google.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RaisedButton(
                        elevation: 1000.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        color: Color(0xFF0A0E21),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('images/facebook.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Username',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: usernameController,
                    onSaved: (value) {
                      //print("username: ${value}");
                      usernameController.text = value!;
                    },
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Username";
                      }
                      if (!regex.hasMatch(value)) {
                        return "At least 6 character with atleast 1 uppercase,\n1 digit and 1 lowercase";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: 'Enter your username..',
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    onSaved: (value) {
                      print("email: ${value}");
                      emailController.text = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your Email";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please Enter valid Email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: 'Enter your email..',
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Country',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    //textAlign: TextAlign.center,
                    autofocus: false,
                    controller: countryController,
                    onSaved: (value) {
                      print("country: ${value}");
                      countryController.text = value!;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: 'Enter your country..',
                      hintStyle: TextStyle(color: Colors.white30),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    autofocus: false,
                    onSaved: (value) {
                      print("password: ${value}");
                      passwordController.text = value!;
                    },
                    validator: (value) {
                      confirmPass = value;
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return "Please Enter a Password";
                      }
                      if (!regex.hasMatch(value)) {
                        return "At least 6 character with atleast 1 uppercase,\n1 digit,1 lowercase,1 special character";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: 'Enter your password..',
                      hintStyle: TextStyle(color: Colors.white30),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    autofocus: false,
                    controller: confirmPasswordController,
                    onSaved: (value) {
                      print("confirm password: ${value}");
                      confirmPasswordController.text = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Confirm your Password";
                      }
                      if (confirmPass != value) {
                        return "Password Don't Match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: 'Confirm your password...',
                      hintStyle: TextStyle(color: Colors.white30),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "front_screen");
                          /*setState(() {
                            showspinner = true;
                          });

                          if (_formKey.currentState!.validate()) {
                            await _auth
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) => {
                                      PostDetailtoFirestore(),
                                    })
                                .catchError((e) {
                              Fluttertoast.showToast(
                                  msg: e!.message, textColor: Colors.red);
                              setState(
                                () {
                                  showspinner = false;
                                },
                              );
                            });
                          }
                          setState(
                            () {
                              showspinner = false;
                            },
                          );*/
                        },
                        minWidth: 200.0,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          ' Login',
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
