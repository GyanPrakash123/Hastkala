import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hastkala/chat_screen.dart';
import 'package:hastkala/contest_code.dart';
import 'package:hastkala/earn_splash.dart';
import 'package:hastkala/edit_profile.dart';
import 'package:hastkala/hiring_detail.dart';

import 'package:hastkala/hiring_screen.dart';
import 'package:hastkala/message_screen.dart';
import 'package:hastkala/posts.dart';
import 'package:hastkala/profile_screen.dart';
import 'package:hastkala/project_detail.dart';
import 'package:hastkala/question_screen.dart';
import 'package:hastkala/uid.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'menu_item.dart';
import 'edit_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'posts.dart';
import 'hiring_screen.dart';
import 'winner_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'message_screen.dart';
import 'earn_splash.dart';
import 'hiring_detail.dart';
import 'project_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(HastKala());
}

class HastKala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HastKala',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(color: Color(0xFF0A0E21)),
      ),
      initialRoute: 'splash_screen',
      routes: {
        'front_screen': (context) => FrontPage(),
        'login_screen': (context) => LoginScreen(),
        'register_screen': (context) => RegisterScreen(),
        'splash_screen': (context) => SplashScreen(),
        'editProfile_screen': (context) => EditProfile(),
        //'post_screen': (context) => PostsScreen(),
        'hiring_screen': (context) => HiringScreen(),
        'winner_screen': (context) => WinnerScreen(),
        'profile_screen': (context) => ProfileScreen(),
        'chat_screen': (context) => ChatScreen(),
        'message_screen': (context) => MessageScreen(),
        //'question_screen': (context) => QuestionScreen(),
        'earn_splash': (context) => EarnSplash(),
        'hiring_detail': (context) => HiringDetail(),
        'project_detail': (context) => ProjectDetail(),
      },
    );
  }
}

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  num get value => 3;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemRefer:
        break;
      case MenuItems.itemContact:
        break;
    }
  }

  Color active = Colors.white;
  String? selectedKey;
  List<String> keys = <String>[
    'About',
    'Contact Us',
    'LogOut',
  ];

  //accessing the data from firebase
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => this.loggedInUser = UserModel.fromMap(value.data()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('HastKala',
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              )),
        ),
        leading: PopupMenuButton<MenuItem>(
          color: Colors.blue,
          icon: Icon(Icons.menu),
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            ...MenuItems.itemsFirst.map(buildItem).toList(),
            PopupMenuDivider(),
            ...MenuItems.itemsSecond.map(buildItem).toList(),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('images/gyan.jpg'),
            ),
          ),
        ],
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (Context) =>
                            QuestionScreen(loggedInUser.uid)));
              },
              child: Container(
                height: 150.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage('images/test.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            height: 70.0,
            width: 320.0,
            decoration: BoxDecoration(
              color: Color(0xFF111328),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Text(
                  ' Hi ${loggedInUser.username} !',
                  style: GoogleFonts.abrilFatface(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                RatingBar.builder(
                    itemSize: 20.0,
                    minRating: 3,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          size: 1.0,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {}),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostsScreen(loggedInUser.uid)));
                  });
                },
                child: Container(
                  height: 120.0,
                  width: 150.0,
                  child: Card(
                    elevation: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.images,
                          size: 50.0,
                        ),
                        Center(
                          child: Text(
                            'Images',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    color: Color(0xFF111328),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'earn_splash');
                  },
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    child: Card(
                      elevation: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.paid,
                            size: 50.0,
                          ),
                          Center(
                            child: Text(
                              'Earn/Hire',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      color: Color(0xFF111328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile_screen');
                  },
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    child: Card(
                      elevation: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 50.0,
                          ),
                          Center(
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      color: Color(0xFF111328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'winner_screen');
                  },
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    child: Card(
                      elevation: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_events,
                            size: 50.0,
                          ),
                          Center(
                            child: Text(
                              'Winner',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      color: Color(0xFF111328),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF0A0E21),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Messages'),
            ),
          ],
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.tealAccent.shade400,
          iconSize: 40,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              if (_selectedIndex == 2) {
                Navigator.pushNamed(context, 'chat_screen');
              }
            });
          },
          elevation: 5),
    );
  }
}

PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(
            item.icon,
            color: Colors.black,
            size: 20.0,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(item.text),
        ],
      ),
    );
