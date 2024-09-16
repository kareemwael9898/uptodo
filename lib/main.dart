import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'CalenderScreen.dart';
import 'FocusScreen.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

void main() {
  runApp(myApp());
}

Widget myApp() {
  return MaterialApp(
    title: "Focus Todo",
    theme: ThemeData.dark(),
    home: const Screen(),
  );
}

List navBarScreens = [
  HomeScreen(), const CalenderScreen(), // AddScreen(),
  FocusScreen(), ProfileScreen(),
];
List<BottomNavigationBarItem> navBarItems = [
  BottomNavigationBarItem(
      icon: SvgPicture.asset("lib/assets/images/home.svg"), label: "Home"),
  BottomNavigationBarItem(
      icon: SvgPicture.asset("lib/assets/images/calendar.svg"),
      label: "Calendar"),
  // BottomNavigationBarItem(
  //   icon: Icon(Icons.add, color: Colors.white),
  //   label: "Add",
  // ),
  BottomNavigationBarItem(
      icon: SvgPicture.asset("lib/assets/images/clock.svg"), label: "Focus"),
  BottomNavigationBarItem(
    icon: SvgPicture.asset("lib/assets/images/user.svg"),
    label: "Profile",
  ),
];

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedScreen = 1;

  @override
  @override
  Widget build(BuildContext context) {
    //     animationSettings: const NavBarAnimationSettings(
    //       screenTransitionAnimation: ScreenTransitionAnimationSettings(
    //         // Screen transition animation on change of selected tab.
    //         animateTabTransition: true,
    //         duration: Duration(milliseconds: 200),
    //         screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: navBarScreens[selectedScreen],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Clicked -> FloatingActionButton");
          showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                shape: RoundedRectangleBorder(),
                insetPadding: EdgeInsets.zero,
                child: AddEditTaskDialog(),
              );
            },
          );
        },
        backgroundColor: const Color(0XFF8687E7),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: navBarItems,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF363636),
        currentIndex: selectedScreen,
        onTap: (value) {
          setState(() {
            selectedScreen = value;
          });
        },
      ),
      // resizeToAvoidBottomInset: true,
    );
  }
}

class AddEditTaskDialog extends StatelessWidget {
  const AddEditTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF363636),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Title"),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Description"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("lib/assets/images/timer.svg")),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("lib/assets/images/tag.svg")),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("lib/assets/images/flag.svg")),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("lib/assets/images/send.svg")),
            ],
          )
        ],
      ),
    );
  }
}