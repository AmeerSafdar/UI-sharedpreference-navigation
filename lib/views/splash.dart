import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginpractice/views/home_screen.dart';
import 'package:loginpractice/views/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  String? email;
  String? name ;
  String?password;
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    getEmail();
    startTimer();
  }

  getEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     email = prefs.getString('email');
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() async{
    if (email==null) {
       Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SignUpScreen()
      )
    );
    }
    else{
       SharedPreferences prefs = await SharedPreferences.getInstance();
         email= prefs.getString('email');
         name=  prefs.getString('name',);
         password= prefs.getString('password',);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomeScreen(emai: email.toString(), name: name.toString(), pass:password.toString(),)
      )
    );
    }
   
  }

  initScreen(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
              child: Image.asset("assets/images/download.png"),
        ),
      ),
    );
  }
}