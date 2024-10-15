import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Message Page', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),),
      ),
      body: Center(
        child: Text('Ini Adalah Aplikasi Untuk Mendapatkan Notifikasi', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)), textAlign: TextAlign.center,),
      ),
    );
  }
}
