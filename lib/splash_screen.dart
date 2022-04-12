import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    animation = ColorTween(begin: Colors.blue, end: Color(0xFF0A0E21))
        .animate(controller!);
    controller!.forward();

    controller!.addListener(() {
      setState(() {});
      print(animation!.value);
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Participate in Drawing Context,Earn and Hire',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Image(
                height: 120.0,
                image: AssetImage('images/drawing.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  'HastKala',
                  style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'login_screen');
                },
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
