import 'package:flutter/material.dart';
import 'package:loginpractice/views/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 SharedPreferences prefs = await SharedPreferences.getInstance();
 var email = prefs.getString('email');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
    MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen()
      );
    
  }
}
