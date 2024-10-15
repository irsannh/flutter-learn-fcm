import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notifications_app/controller/auth_service.dart';
import 'package:notifications_app/page/sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Home Page', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),),
        actions: [
          IconButton(onPressed: () async {
            await AuthService.logout();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInPage()), (Route<dynamic> route) => false);
          }, icon: Icon(Icons.logout, color: Colors.white,))
        ],
      ),
      body: Center(
        child: Text('Ini Adalah Aplikasi Untuk Mendapatkan Notifikasi', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)), textAlign: TextAlign.center,),
      ),
    );
  }
}
