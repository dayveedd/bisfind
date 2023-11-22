// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreReviews extends StatefulWidget {
  final String storeImage;
  final String storeName;
  const StoreReviews(
      {super.key, required this.storeImage, required this.storeName});

  @override
  State<StoreReviews> createState() => _StoreReviewsState();
}

class _StoreReviewsState extends State<StoreReviews> {
  final TextEditingController _reviewController = TextEditingController();
  final List<Map<String, dynamic>> storeReview = [
    {
      'name': 'Sokeye David',
      'review':
          ' The welcoming atmosphere and well-organized layout make it a joy to browse through a wide range of products'
    },
    {
      'name': 'John Paul',
      'review':
          'The aisles are well-maintained, and the store has a fresh and inviting feel."'
    },
    {
      'name': 'Ignatius Emeka',
      'review': ' it\'s just around the corner. Accessibility is a big plus!"'
    },
    {
      'name': 'Victoria',
      'review':
          ' From daily essentials to unique finds, there\'s something for everyone. I love the diverse selection'
    },
    {
      'name': 'Favour',
      'review':
          ' it has been a game-changer for our busy family. Their delicious prepared meals are not only a time-saver but a taste sensation'
    },
    {
      'name': 'John Micheal',
      'review':
          ' inviting atmosphere make it the perfect place to start my day. '
    },
    {
      'name': 'Kamsi Ivanna',
      'review':
          ' From flaky croissants to decadent desserts, each bite is a delight.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 53, 52, 52),
        title: Flex(direction: Axis.horizontal, children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Reviews',
                    style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.yellow))),
              ],
            ),
          ),
        ]),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount: storeReview.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 50,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  storeReview[index]['name'],
                                  style: GoogleFonts.mulish(
                                      fontSize: 20,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: 270,
                                    child: Text(
                                      storeReview[index]['review'],
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              height: 1.7)),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color.fromARGB(255, 53, 52, 52),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 53, 52, 52)),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add a Review For ${widget.storeName}',
                                      style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 150,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage(widget.storeImage),
                                            fit: BoxFit.cover,
                                            opacity: 0.7)),
                                  ),
                                ),
                                //SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextField(
                                    controller: _reviewController,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: 'Tell us your experience',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.yellow)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.yellow)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.yellow,
                                              foregroundColor: Colors.black,
                                              minimumSize:
                                                  Size(double.infinity, 50)),
                                          onPressed: () {},
                                          child: Text('Proceed'))),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Text('ADD REVIEW'))),
        ),
      ),
    );
  }
}
