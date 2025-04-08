import 'package:almagram/screens/event_page.dart';
import 'package:almagram/screens/home_page.dart';
import 'package:almagram/screens/profile_page.dart';
import 'package:almagram/screens/gallery_page.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomePage(), EventPage(), GalleryPage(), ProfileScreen()];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff7EA4F9),
          currentIndex: _currentIndex,
          onTap: _onTabTapped,

          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 62, 82, 124),
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
            const BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Gallery'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
