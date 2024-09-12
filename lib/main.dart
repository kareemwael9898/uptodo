import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_todo/CalenderScreen.dart';
import 'package:focus_todo/FocusScreen.dart';
import 'package:focus_todo/HomeScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import './ProfileScreen.dart';
import 'AddScreen.dart';

void main() {
  runApp(myApp());
}

Widget myApp() {
  return MaterialApp(
    title: "Focus Todo",
    theme: ThemeData.dark(),
    home: Screen(),
  );
}

class Screen extends StatelessWidget {
  const Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        backgroundColor: const Color(0xFF363636),
        navBarStyle: NavBarStyle.style15,
        animationSettings: const NavBarAnimationSettings(
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        padding: const EdgeInsets.only(top: 2),

        // Todo Change initial index
        controller: PersistentTabController(initialIndex: 1),
        screens: [
          HomeScreen(),
          CalenderScreen(),
          AddScreen(),
          FocusScreen(),
          ProfileScreen(),
        ],
        items: [
          PersistentBottomNavBarItem(
              icon: SvgPicture.asset("lib/assets/images/home.svg"),
              title: "Home"),
          PersistentBottomNavBarItem(
              icon: SvgPicture.asset("lib/assets/images/calendar.svg"),
              title: "Calendar"),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            title: "Add",
          ),
          PersistentBottomNavBarItem(
              icon: SvgPicture.asset("lib/assets/images/clock.svg"),
              title: "Focus"),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset("lib/assets/images/user.svg"),
            title: "Profile",
          ),
        ],
      ),
    );
    // )
  }
}
