import 'package:flutter/material.dart';
import 'package:flutter_navigation_starter/pages/page_home.dart';
import 'package:flutter_navigation_starter/pages/page_settings.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _Tabs createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.warning), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.forward), label: "Settings"),
          ],
          onTap: (int index) {
            setState(() => _currentIndex = index);
          },
        ),
        body: _buildPage(_currentIndex));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return PageHome(
          title: "Home",
        );
      case 1:
        return PageSettings(
          title: "Settings",
        );
      default:
        return PageHome(
          title: "Home",
        );
    }
  }
}
