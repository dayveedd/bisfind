// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/authentication/auth_function/auth_function.dart';
import 'package:bisfind/pages/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/business7.webp'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12)),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'name',
                          enabledBorder: UnderlineInputBorder(
                              //borderSide: BorderSide(color: Colors.black)
                              ),
                          focusedBorder: UnderlineInputBorder(
                              //borderSide: BorderSide(color: Colors.grey)
                              )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'email',
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 30,
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
                      height: 130,
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
                                createAccount(_emailController.text,
                                    _passwordController.text);
                              },
                              child: Text('Sign up')),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('existing user?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignIn()));
                            },
                            child: Text(
                              'Sign in',
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
