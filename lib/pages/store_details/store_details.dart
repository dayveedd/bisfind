// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/store_details/store_location.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDetails extends StatefulWidget {
  final String storeImage;
  final String storeName;
  final String storeDistance;
  final String storeRatings;
  const StoreDetails(
      {super.key,
      required this.storeImage,
      required this.storeName,
      required this.storeDistance,
      required this.storeRatings});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 53, 52, 52),
          elevation: 0,
          title: Container(
            padding: EdgeInsets.all(8),
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'search businesses',
                  style: GoogleFonts.libreBaskerville(fontSize: 10),
                ),
                Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 70, 70, 70),
                )
              ],
            ),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.storeImage),
                      fit: BoxFit.cover,
                      opacity: 0.5)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.storeName,
                                style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.yellow))),
                            //SizedBox(height: 10,),
                            Text(widget.storeDistance,
                                style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)))
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ratings: '),
                              Text(widget.storeRatings,
                                  style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 100,
                    color: Colors.yellow,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DISTANCE : ',
                      style: GoogleFonts.mulish(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.yellow))),
                  Text(
                    widget.storeDistance,
                    style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.yellow)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color.fromARGB(255, 53, 52, 52),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StoreLocation(storeName: widget.storeName, storeRating: widget.storeRatings,storeImage: widget.storeImage,)));
                  },
                  child: Text(
                    'VIEW STORE LOCATION',
                    style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                  ))),
        ),
      ),
    );
  }
}
