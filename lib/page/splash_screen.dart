import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notifications_app/page/home_page.dart';
import 'package:notifications_app/page/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())
        );
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInPage())
        );
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications, color: Colors.white, size: 48,),
            SizedBox(height: 16,),
            Text('Notifications App', style: GoogleFonts.poppins(textStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
            )),)
          ],
        ),
      ),
    );
  }
}
