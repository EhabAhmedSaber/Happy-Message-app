
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constent.dart';
import 'package:login/home_screen.dart';
import 'package:login/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()
  {
    getValidationData().whenComplete(() {
      Timer(Duration(seconds:2),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>finalEmail==null ? LoginForm() : HomeScreen() )));
    });
    super.initState();
  }

  Future getValidationData()async
  {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail= sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            CircularProgressIndicator(
              backgroundColor:KwhiteColor ,
            ),
            SizedBox(height: 30.0,),

            Text(
              'Happy Message App',
              style: splashTitle,
            ),
          ],
        ),
      ),
    );
  }
}
