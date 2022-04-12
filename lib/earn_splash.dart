import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnSplash extends StatefulWidget {
  const EarnSplash({Key? key}) : super(key: key);

  @override
  _EarnSplashState createState() => _EarnSplashState();
}

class _EarnSplashState extends State<EarnSplash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Want to earn or hire then tap on respective buttons',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .10),
            CircleAvatar(
              backgroundImage: AssetImage('images/drawing.png'),
              radius: 50,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: MaterialButton(
                elevation: 8,
                onPressed: () {
                  Navigator.pushNamed(context, 'hiring_screen');
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      'Earn',
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                            //color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              elevation: 8,
              onPressed: () {
                Navigator.pushNamed(context, "hiring_detail");
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text(
                    'Hire',
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                          //color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
