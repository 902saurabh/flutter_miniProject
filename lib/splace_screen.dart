import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class splace_screen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        fit: StackFit.expand,

        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              color: new Color(0xff622f74),
              gradient: LinearGradient(
                  colors: [new Color(0xfffccb49),new Color(0xff65ce8e)],
                begin: Alignment.center,
                end: Alignment.centerLeft,
              )
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            CircleAvatar(

            backgroundColor: Colors.white,
            radius: 75.0,
            child: Image.asset('Images/ak_logo.png'),
      ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            )
          ],
          ),

        ],
      ),
    );
  }
}