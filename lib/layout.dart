// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bisfind/pages/home_page/home_page.dart';
import 'package:bisfind/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

class LayOutPage extends StatefulWidget {
  const LayOutPage({super.key});

  @override
  State<LayOutPage> createState() => _LayOutPageState();
}

class _LayOutPageState extends State<LayOutPage> {
  int _currentIndex = 0;

  final List pages = [HomePage(), ProfilePage()];

  Widget _buildNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () => setState(() {
        _currentIndex = index;
      }),
      child: Container(
        child: Icon(icon, color: _currentIndex == index ? Colors.black : Color.fromARGB(255, 225, 203, 9),size: 40,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 0,
        height: 60,
        color: Color.fromARGB(255, 53, 52, 52),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              0,
              Icons.home,
            ),
            _buildNavItem(
              1,
              Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}
