import 'package:flutter/material.dart';
import 'package:visionmeet/common/resources/auth_methods.dart';
import 'package:visionmeet/common/routes/name.dart';
import 'package:visionmeet/common/utils/colors.dart';
import 'package:get/get.dart';
import 'package:visionmeet/screens/home_screen/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthMethods _authMethods=AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [



          Text("Start or join a meeting",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),),

          SizedBox(height: 50,),

          Container(
            height: 350,
            width: double.infinity,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/onboarding.jpg"),
                fit: BoxFit.fill

              )
            ),

          ),

          SizedBox(height: 50,),

          InkWell(
            onTap: ()async{
              bool res=await _authMethods.signInWithGoogle(context);

              if(res){
                Get.toNamed(RouteName.HomeScreen);
              }
            },
            splashColor: Colors.white,
            child: Container(

              height: 45,
              width: 325,

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),

              ),
              child: Center(
                child: Text("Google Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
              ),

            ),
          )


        ],
      ),

    );
  }
}
