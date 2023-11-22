// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/profile_page/logout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/profile.webp'))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Notification',
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1, color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.help,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Help',
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1, color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Contact us',
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1, color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.yellow,
                        ),
                        title: Text(
                          'Settings',
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.1, color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return LogoutModal();
                                  });
                            },
                            child: Text(
                              'LOGOUT',
                              style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w700)),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
