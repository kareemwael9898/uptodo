import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_todo/CalenderScreen.dart';

late Function profileScreenSetState;

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    profileScreenSetState = setState;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(fontSize: 20),
                    ),
                    Image(
                      image: const AssetImage("lib/assets/images/profile.png"),
                      width: screenWidth * 0.3,
                    ),
                    const Text(
                      "Kareem Wael",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0XFF363636),
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 17),
                    child: Text(
                      "${countAllByStatus(isChecked: false)} Tasks Left",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0XFF363636),
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 17),
                    child: Text(
                      "${countAllByStatus(isChecked: true)} Tasks done",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text("Settings", style: TextStyle(fontSize: 14)),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/settings.svg",
                    color: Colors.white),
                title:
                    const Text("App Settings", style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Text("Account", style: TextStyle(fontSize: 14)),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/user.svg",
                    color: Colors.white),
                title: const Text("Change account name",
                    style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/key.svg",
                    color: Colors.white),
                title: const Text("Change account password",
                    style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/camera.svg",
                    color: Colors.white),
                title: const Text("Change account Image",
                    style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Text("Uptodo", style: TextStyle(fontSize: 14)),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/menu.svg",
                    color: Colors.white),
                title: const Text("About US", style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/info.svg",
                    color: Colors.white),
                title: const Text("FAQ", style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/flash.svg",
                    color: Colors.white),
                title: const Text("Help & Feedback",
                    style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/like.svg",
                    color: Colors.white),
                title: const Text("Support US", style: TextStyle(fontSize: 16)),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: SvgPicture.asset("lib/assets/images/logout.svg",
                    color: Colors.red),
                title: const Text("Log out",
                    style: TextStyle(fontSize: 16, color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int countAllByStatus({required bool isChecked}) {
  int count = 0;
  Todos.todosMap.values.forEach((list) {
    for (var item in list) {
      if (item.isChecked == isChecked) {
        count++;
      }
    }
  });
  return count;
}
