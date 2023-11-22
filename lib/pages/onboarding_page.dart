// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authentication/sign_in.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> carouselData = [
    {
      'image': 'images/business1.jpeg',
      'text': 'A vast and diverse selection of businesses at your finger tips.'
    },
    {
      'image': 'images/business6.webp',
      'text': 'A vast and diverse selection of businesses at your finger tips.'
    },
    {
      'image': 'images/business5.jpg',
      'text': 'A vast and diverse selection of businesses at your finger tips.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: width < 600
                  ? Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Column(
                        children: [                      
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              for (int i = 0; i < carouselData.length; i++)
                                AnimatedOpacity(
                                  opacity: _currentIndex == i ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 350,
                                        child: Container(
                                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(carouselData[i]['image'],), fit: BoxFit.cover,), borderRadius: BorderRadius.circular(16)),
                                        )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          width: 360,
                                          height: 50,
                                          child: Text(carouselData[i]['text'],
                                              textAlign: TextAlign.center,
                                             style: GoogleFonts.libreBaskerville(textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  height: 1.7,                                                 
                                                  fontWeight:
                                                      FontWeight.w700)))),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (int i = 0;
                                              i < carouselData.length;
                                              i++)
                                            Container(
                                              width: _currentIndex == i ? 30 : 15,
                                              height:
                                                  4, // You can adjust the height to your preference
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    3), // Adjust the border radius as needed
                                                color: _currentIndex == i
                                                    ? Colors.yellow
                                                    : Colors.grey,
                                              ),
                                            ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: false,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: carouselData
                                .map((item) =>
                                    Container(color: Colors.transparent))
                                .toList(),
                          ),
                        ],
                      ),
                  )
                  : Center(
                      child: Column(
                        children: [                          
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              for (int i = 0; i < carouselData.length; i++)
                                AnimatedOpacity(
                                  opacity: _currentIndex == i ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 350,
                                        child: Container(
                                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(carouselData[i]['image'],), fit: BoxFit.cover,)),
                                        )
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          width: 360,
                                          height: 50,
                                          child: Text(carouselData[i]['text'],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.libreBaskerville(textStyle: TextStyle(
                                                  color: Color(0xFF020202),
                                                  fontSize: 15,
                                                  height: 1.7,                                                 
                                                  fontWeight:
                                                      FontWeight.w700)))),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (int i = 0;
                                              i < carouselData.length;
                                              i++)
                                            Container(
                                              width:
                                                  _currentIndex == i ? 30 : 15,
                                              height:
                                                  4, // You can adjust the height to your preference
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                    3), // Adjust the border radius as needed
                                                color: _currentIndex == i
                                                    ? Colors.orange
                                                    : Colors.grey,
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (width > 600)
                                        SizedBox(
                                          height: 270,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xFFFF7F00),
                                                    foregroundColor:
                                                        Colors.white,
                                                    minimumSize: Size(400, 50),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_currentIndex < 2) {
                                                        _currentIndex++;
                                                      } else {
                                                        _currentIndex == 2;
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SignIn()));
                                                      }
                                                    });
                                                  },
                                                  child: _currentIndex < 2
                                                      ? Text(
                                                          'NEXT',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Mulish',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )
                                                      : Text('Sign in'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: false,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: carouselData
                                .map((item) =>
                                    Container(color: Colors.transparent))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        bottomNavigationBar: width < 600
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_currentIndex < 2) {
                            _currentIndex++;
                          } else {
                            _currentIndex == 2;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignIn()));
                          }
                        });
                      },
                      child: _currentIndex < 2
                          ? Text(
                              'NEXT',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700),
                            )
                          : Text('Sign in'),
                    ),
                  ),
                ]),
              )
            : null);
  }
}
