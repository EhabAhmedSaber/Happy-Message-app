import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KprimaryColor,
        title: Text(
          'The happy Message',
          style: TextStyle(
            color: KwhiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 200,
        ),
        child: Column(
          children: [
            Center(
              child: Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(child: Text(
                  'Always be Happy, always wear a smile; Not because life is full of reasons to smile but because your smile itself is a reason for many others to smile. . .'
                  ),
                ),
              ),
            ),
           ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 80.0,
                right: 80.0,
              ),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: KprimaryColor
                ),
                child:TextButton(
                  onPressed: ()async{
                    final SharedPreferences sharedPreferenes= await SharedPreferences.getInstance();
                    sharedPreferenes.remove('email');
                   showDialog(context: context,
                       builder: (context) => AlertDialog(
                         title: Text(
                           'Are you sure you are logged out?'
                         ),
                         actions: <Widget>[
                           TextButton(child: Text(' Yes'), onPressed: () {
                             Navigator.push(context,
                               MaterialPageRoute(builder: (context) => LoginForm(),),
                             );
                           }),
                           TextButton(child: Text('No'), onPressed: () {
                             Navigator.push(context,
                               MaterialPageRoute(builder: (context) => HomeScreen(),),
                             );
                           }),
                         ],
                         ),
                   );
                  },
                  child: Text(
                    'Log Out',
                    style:textButton.copyWith(color: KwhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
