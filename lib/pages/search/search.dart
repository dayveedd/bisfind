// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaerchBusiness extends StatefulWidget {
  const SaerchBusiness({super.key});

  @override
  State<SaerchBusiness> createState() => _SaerchBusinessState();
}

class _SaerchBusinessState extends State<SaerchBusiness> {
  final text = 'Sorry we couldn\'t find what you\'re looking for';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 53, 52, 52),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
        title: TextField(
          onChanged: (value) {
            value = text;
          },
          decoration: InputDecoration(
            hintText: 'search business',
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: Text(text, style: GoogleFonts.mulish(
              textStyle: TextStyle(
                color: Colors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w700
              )
            ),),
          ),
        ),
      ),
    );
  }
}
