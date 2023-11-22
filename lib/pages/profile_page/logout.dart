// ignore_for_file: prefer_const_constructors

import 'package:bisfind/pages/authentication/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutModal extends StatefulWidget {
  const LogoutModal({super.key});

  @override
  State<LogoutModal> createState() => _LogoutModalState();
}

class _LogoutModalState extends State<LogoutModal> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 53, 52, 52)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 72,
                    height: 4,
                    decoration: ShapeDecoration(
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: AssetImage('images/logout2.gif'))),
            ),
            // Image.asset(
            //   'images/logout2.gif',
            //   height: width > 400 ? 150 : 150,
            // ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'Are you sure you want to logout?',
              style: GoogleFonts.mulish(
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            )),
            // SizedBox(height: 20,),
            SizedBox(
              height: width > 400 ? 150 : 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    Color.fromARGB(255, 53, 52, 52),
                                foregroundColor: Colors.yellow,
                                minimumSize: Size(width > 400 ? 180 : 150, 50)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel')),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                foregroundColor: Colors.black,
                                minimumSize: Size(width > 400 ? 180 : 150, 50)),
                            onPressed: () {
                              Navigator.pop(context);
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignIn()));
                            },
                            child: Text('Logout')),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
