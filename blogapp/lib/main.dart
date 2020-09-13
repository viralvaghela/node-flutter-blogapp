import 'package:flutter/material.dart';

import 'addpost_screen.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() { 
    super.initState();
     _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Blog App"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
             Tab(text: "Home"),
            Tab(
              text: "ADD POST",
            ),
          ],
        ),),
        body: TabBarView(
          controller: _tabController,
          children: [
          
          HomeScreen(),
          AddPostScreen()
        ]),
      ),
    );
  }
}
