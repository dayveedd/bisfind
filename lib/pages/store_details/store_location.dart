// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/store_details/store_reviews.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class StoreLocation extends StatefulWidget {
  final String storeName;
  final String storeRating;
  final String storeImage;
  const StoreLocation(
      {super.key, required this.storeName, required this.storeRating, required this.storeImage});

  @override
  State<StoreLocation> createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocation> {
  List<Marker> _getFilteredMarkers() {
    List<Marker> markers = [];

    // Add a marker for the selected store
    for (var storeLocation in storeLocations) {
      double latitude = storeLocation['latitude']!;
      double longitude = storeLocation['longitude']!;

      Marker marker = Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(latitude, longitude),
        builder: (context) => IconButton(
          onPressed: () {
            // Handle marker tap for the selected store
          },
          icon: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 35,
          ),
        ),
      );
      markers.add(marker);
    }

    return markers;
  }

  List<Map<String, double>> storeLocations = [
    {'latitude': 6.4856, 'longitude': 3.3013},
    {'latitude': 6.4295, 'longitude': 3.4367},
    {'latitude': 6.4425, 'longitude': 3.4395},
    {'latitude': 6.45, 'longitude': 3.2667},
    {'latitude': 6.5167, 'longitude': 3.3191},
    {'latitude': 6.5973, 'longitude': 3.2576},
    {'latitude': 6.53, 'longitude': 3.332},
    {'latitude': 6.6016, 'longitude': 3.3547},
    {'latitude': 6.4602, 'longitude': 3.3136},
    {'latitude': 6.4699, 'longitude': 3.3227},
    {'latitude': 6.5102, 'longitude': 3.0927},
    {'latitude': 6.6562, 'longitude': 3.5195},
  ];

  LatLng calculateCenter(List<Map<String, double>> locations) {
    double sumLat = 0;
    double sumLng = 0;

    for (var location in locations) {
      sumLat += location['latitude']!;
      sumLng += location['longitude']!;
    }

    return LatLng(sumLat / locations.length, sumLng / locations.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 52, 52),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 53, 52, 52),
        title: Text(
          widget.storeName,
          style: GoogleFonts.mulish(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.yellow)),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: FlutterMap(
                options: MapOptions(
                  center: calculateCenter(storeLocations),
                  zoom: 10.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 120,
                      size: const Size(40, 40),
                      fitBoundsOptions: const FitBoundsOptions(
                        padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                      ),
                      markers: _getFilteredMarkers(),
                      builder: (context, markers) {
                        return FloatingActionButton(
                          onPressed: null,
                          child: Text(markers.length.toString()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
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
                                  color:
                                      Colors.yellow))), //SizedBox(height: 10,),
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
                        Text(widget.storeRating,
                            style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)))
                      ],
                    ),
                  )
                ],
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Open Hours:  ',
                        style: GoogleFonts.mulish(
                            textStyle:
                                TextStyle(fontSize: 17, color: Colors.white)),
                      ),
                      Text('Mondays - Fridays(9am - 7pm)',
                          style: GoogleFonts.mulish(
                              textStyle:
                                  TextStyle(fontSize: 12, color: Colors.white)))
                    ],
                  ),
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
                    children: [
                      Text('Tel no:  ',
                          style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  fontSize: 17, color: Colors.white))),
                      Text('+234 906 727 4874',
                          style: GoogleFonts.mulish(
                              textStyle:
                                  TextStyle(fontSize: 12, color: Colors.white)))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1, color: Colors.grey)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 53, 52, 52),
        elevation: 0,
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StoreReviews(storeImage: widget.storeImage,storeName: widget.storeName,)));
                  },
                  child: Text('SEE STORE REVIEWS'))),
        ),
      ),
    );
  }
}
