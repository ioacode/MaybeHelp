import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_helloworld/introSlide.dart';

class introApp extends StatefulWidget {
  @override
  _introAppState createState() => _introAppState();
}

class _introAppState extends State<introApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 15), ()=>{
      Navigator.of(context).push(_createRoute())
    });
  }
 
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.grey,
      child: Center(
      
          child: Image.asset(
        "assets/images/logoIntro.png",
        alignment: Alignment.center,
        fit: BoxFit.fitWidth,
        width: width / 3,
        height: width / 3,
      )),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => IntroSlideAction(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
