// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/store_details/store_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> businessList = [
    {
      'store name':'Levis Store',
      'distance':'0.90KM',
      'ratings':'4.5',
      'image':'images/business9.jpg'
    },
     {
      'store name':'Bisi Cafe',
      'distance':'0.70KM',
      'ratings':'4',
      'image':'images/business1.jpeg'
    },
     {
      'store name':'James Coffee',
      'distance':'3 miles',
      'ratings':'5',
      'image':'images/business2.jpeg'
    },
     {
      'store name':'Denim Store',
      'distance':'1.90KM',
      'ratings':'3.5',
      'image':'images/business4.webp'
    },
     {
      'store name':'Big BAZA',
      'distance':'0.64KM',
      'ratings':'2.5',
      'image':'images/business5.jpg'
    },
     {
      'store name':'David\'s Chicken',
      'distance':'2 miles',
      'ratings':'4.5',
      'image':'images/business6.webp'
    },
     {
      'store name':'Podd Fitness',
      'distance':'0.45KM',
      'ratings':'3.5',
      'image':'images/business7.webp'
    },
     {
      'store name':'Henry\'s Kitchen',
      'distance':'1 mile',
      'ratings':'0',
      'image':'images/business8.webp'
    },
     {
      'store name':'Hughie Electronics',
      'distance':'1 mile',
      'ratings':'4.5',
      'image':'images/business10.webp'
    },
     {
      'store name':'Paul\'s Tutorial',
      'distance':'0.77KM',
      'ratings':'5',
      'image':'images/business11.jpg'
    },
     {
      'store name':'Jejj\'s Kitchen',
      'distance':'0.90M',
      'ratings':'3.5',
      'image':'images/business12.jpg'
    },
     {
      'store name':'Jenny\'s Groceries',
      'distance':'0.20KM',
      'ratings':'2.5',
      'image':'images/business13.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 53, 52, 52),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                itemCount: businessList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 150,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StoreDetails(storeImage: businessList[index]['image'], storeName: businessList[index]['store name'], storeDistance: businessList[index]['distance'], storeRatings: businessList[index]['ratings']))),
                      child: Container(
                        decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.yellow, width: 2),), image: DecorationImage(image: AssetImage(businessList[index]['image']), fit: BoxFit.cover,opacity: 0.3)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(businessList[index]['store name'], style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.yellow)),),
                              SizedBox(height: 10,),
                              Text(businessList[index]['distance'], style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white))),
                              SizedBox(height: 10,),
                              Row(children: [
                                Icon(Icons.star, color: Colors.yellow,),
                                Text(businessList[index]['ratings'], style: GoogleFonts.mulish(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)))
                              ],)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
