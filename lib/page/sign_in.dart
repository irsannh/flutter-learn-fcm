import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notifications_app/controller/auth_service.dart';
import 'package:notifications_app/page/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Login Page', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 150,),
                    Text('Selamat Datang!', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),),
                    SizedBox(height: 50,),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal)),),
                          SizedBox(height: 16,),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Email Anda',
                              hintStyle: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w200)),
                              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                              helperText: ' ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.teal, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.red, width: 1),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              if (!value!.contains('@')) {
                                return 'Masukkan email yang valid';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16,),
                          Text('Password', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal)),),
                          SizedBox(height: 16,),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Password Anda',
                              hintStyle: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w200)),
                              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                              helperText: ' ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.teal, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.red, width: 1),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }
                              if (value.length < 8) {
                                return 'Password kurang dari 8 karakter';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16,),
                          SizedBox(
                            height: 50, width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.teal),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                              ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await AuthService.login(_emailController.text, _passwordController.text).then((value) {
                                      if (value == 'Success Login') {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success Login'), backgroundColor: Colors.green,));
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error Login, $value'), backgroundColor: Colors.red,));
                                      }
                                    });
                                  }
                                },
                                child: Text('Login', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
