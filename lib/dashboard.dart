import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhirssanber/pages/about.dart';
import 'package:tugasakhirssanber/pages/facts.dart';
import 'package:tugasakhirssanber/pages/home.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _navIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    FactScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_navIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
        currentIndex: _navIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_sharp),
            label: "Facts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "About",
          ),
        ],
      ),
    );
  }
}
