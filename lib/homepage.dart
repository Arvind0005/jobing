// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobing/Findjobs.dart';
import 'package:jobing/createjobs.dart';
import 'package:jobing/history.dart';
import 'package:jobing/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int index = 0;
  List<Widget> widgets = [Findjobs(), CreateJobs(), History(), Profile_Page()];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1000.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff64485C),
        unselectedItemColor: Color(0xff99737E),
        // backgroundColor: Color(0xffF64C72),
        // selectedItemColor: Colors.white, Color(0xffEDC7B7),
        // unselectedItemColor: Color(0xff99737E),
        onTap: (int x) {
          setState(() {
            index = x;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.tty), label: "Find Jobs"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.plusCircle), label: "CreateJobs"),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.listAlt),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "profile",
          )
        ],
      ),
      body: widgets[index],
    );
  }
}
