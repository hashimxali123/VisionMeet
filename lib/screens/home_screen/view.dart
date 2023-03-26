import 'package:flutter/material.dart';
import 'package:visionmeet/common/resources/auth_methods.dart';
import 'package:get/get.dart';
import 'package:visionmeet/common/routes/name.dart';
import 'package:visionmeet/common/utils/colors.dart';
import 'package:visionmeet/screens/home_screen/contact_screen.dart';
import 'package:visionmeet/screens/home_screen/history_meeting_screen.dart';
import 'package:visionmeet/screens/home_screen/meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  AuthMethods _authMethods=AuthMethods();


  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    ContactScreen(),
    Center(
      child: GestureDetector(

        onTap:(){
           AuthMethods().signOut();
           Get.toNamed(RouteName.SignIn);
        },
        child: Container(

          child: Text("LogOut"),

        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),

      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(

      backgroundColor: footerColor,
      selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey ,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet & Char',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
