import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_palatte.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representation/screens/home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  static String routeName = '/main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.purple,
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kDefaultPadding),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.house, size: kBottomBarIconSize,), 
            title: Text('Home')),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.solidHeart, size: kBottomBarIconSize,), 
            title: Text('Likes')),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.briefcase, size: kBottomBarIconSize,), 
            title: Text('Booking')),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.solidUser, size: kBottomBarIconSize,), 
            title: Text('Profile')),
        ],
      ),
    );
  }
}