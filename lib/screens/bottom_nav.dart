import 'package:almagram/screens/bhajan_page.dart';
import 'package:almagram/screens/home_page.dart';
import 'package:almagram/screens/referral_page.dart';
import 'package:almagram/screens/todo_page.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    BhajanPage(),
    TodoPage(),
    ReferralPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff7EA4F9), Color(0xff4375EB)],
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
           
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade300,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.music_note),
                label: 'Bhajan',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                label: 'To do task',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/referral_icon.png"),
                label: 'To do task',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
