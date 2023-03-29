import 'package:flutter/material.dart';
import 'package:news_api/views/health.dart';
import 'package:news_api/views/science.dart';
import 'package:news_api/views/sports.dart';

import 'my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
           
            title: const Text(
              "News App",
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Sports",
                  icon: Icon(Icons.sports),
                ),
                Tab(
                  text: "Science",
                  icon: Icon(Icons.science),
                ),
                Tab(
                  text: "Health",
                  icon: Icon(Icons.health_and_safety),
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Sports(),
              Science(),
              Health(),
            ],
          ),
        ),
      ),
    );
  }
}
