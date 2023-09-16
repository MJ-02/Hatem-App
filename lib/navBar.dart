import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Test User",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),

            accountEmail: const Text(
              "TestUser12345@gmail.com",
            ),

            currentAccountPicture: ClipOval(
              child: Image.asset('assets/blank.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              image: DecorationImage(image: AssetImage('assets/school.jpg'), fit: BoxFit.cover)
            ),
          ),
          // ListTile(
          //   leading: ,
          // ),
        ],
      ),
    );
  }
}
