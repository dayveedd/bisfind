// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/layout.dart';
import 'package:bisfind/pages/authentication/auth_function/auth_function.dart';
import 'package:bisfind/pages/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisibility = false;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/business7.webp'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(                     
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'email',
                          enabledBorder: UnderlineInputBorder(
                              //borderSide: BorderSide(color: Colors.black)
                              ),
                          focusedBorder: UnderlineInputBorder(
                              //borderSide: BorderSide(color: Colors.grey)
                              )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              },
                              icon: isVisibility
                                  ? Icon(Icons.visibility_outlined)
                                  : Icon(Icons.visibility_off_outlined)),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 48, 47, 47),
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(170, 50)),
                              onPressed: () {
                                if (_emailController.text.isNotEmpty ||
                                    _passwordController.text.isNotEmpty) {
                                  loginUser(_emailController.text,
                                      _passwordController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LayOutPage()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Fields should not be empty')));
                                }
                              },
                              child: Text('Sign in')),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('new user?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUp()));
                            },
                            child: Text(
                              'Signup',
                              style: GoogleFonts.libreBaskerville(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 17)),
                            )),
                      ],
                    )
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
