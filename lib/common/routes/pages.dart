
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:visionmeet/common/routes/name.dart';
import 'package:visionmeet/screens/home_screen/contact_screen.dart';
import 'package:visionmeet/screens/home_screen/history_meeting_screen.dart';
import 'package:visionmeet/screens/home_screen/video_call.dart';
import 'package:visionmeet/screens/home_screen/view.dart';
import 'package:visionmeet/screens/login_screen/view.dart';

class AppRoutes{

  static final List<GetPage> routes=[

    GetPage(
        name: RouteName.SignIn,
        page: ()=>LoginScreen()
    ),


    GetPage(
        name: RouteName.HomeScreen,
        page: ()=>HomeScreen()
    ),

    GetPage(
        name: RouteName.VideoScreen,
        page: ()=>VideoCallScreen()
    ),

    GetPage(
        name: RouteName.HistoryMeetingScreen,
        page: ()=>HistoryMeetingScreen()
    ),

    GetPage(
        name: RouteName.ContactScreen,
        page: ()=>ContactScreen()
    ),





  ];

}