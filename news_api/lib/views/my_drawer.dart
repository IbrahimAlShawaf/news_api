import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_api/views/business.dart';
import 'package:news_api/views/entertainment.dart';
import 'package:news_api/views/general.dart';
import 'package:news_api/views/technology.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeIn,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              //color: Color(0xff622ca7),
            ),
            child: Image.asset(
              "assets/news.png",
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color(0xff622ca7),
              size: 35,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xff622ca7).withOpacity(1),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Other News',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff622ca7),
              ),
            ),
          ),
          //  const Divider(),
          ListTile(
            leading: const Icon(
              Icons.generating_tokens,
              color: Color(0xff622ca7),
              size: 35,
            ),
            title: Text(
              'General',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xff622ca7).withOpacity(1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const General()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.money_off,
              color: Color(0xff622ca7),
              size: 35,
            ),
            title: Text(
              'Business',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xff622ca7).withOpacity(1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Business()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.hourglass_full,
              color: Color(0xff622ca7),
              size: 35,
            ),
            title: Text(
              'Entertainment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xff622ca7).withOpacity(1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Entertainment()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.computer,
              color: Color(0xff622ca7),
              size: 35,
            ),
            title: Text(
              'Technology',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xff622ca7).withOpacity(1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Technology()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xff622ca7),
              size: 35,
            ),
            title: Text(
              'Exit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: const Color(0xff622ca7).withOpacity(1),
              ),
            ),
            onTap: () async {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
