import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement Profile screen
    // throw UnimplementedError();
    return Center(
      child: Container(
        color: Colors.yellow,
        child: SvgPicture.asset(
          "lib/assets/images/user.svg",
          // width: 100,
          // height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
