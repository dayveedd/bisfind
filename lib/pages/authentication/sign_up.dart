// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/authentication/auth_function/auth_function.dart';
import 'package:bisfind/pages/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bisfind/resources/auth_method.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isVisibility = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // void registerUser() async {
    //   String resp = await AuthMethods().registerUser(
    //       email: _emailController.text,
    //       password: _passwordController.text,
    //       name: _nameController.text);

    //   if (resp == 'success') {
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (context) => SignIn()));
    //   }
    // }

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
                      'Create Account',
                      style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      controller: _nameController,
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
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'email',
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: true,
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
                                if (_emailController.text.isNotEmpty ||
                                    _passwordController.text.isNotEmpty ||
                                    _nameController.text.isNotEmpty) {
                                  createAccount(_emailController.text,
                                      _passwordController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignIn()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Fields should not be empty')));
                                }
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
