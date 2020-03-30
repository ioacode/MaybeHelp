import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_helloworld/model/datamodel.dart';

class plantFexibleAppBarController extends StatelessWidget {
  final double appBarHeight = 66.0;
  List<plants> baru = new List();
  var totalPlant = 0;
  plantFexibleAppBarController(this.baru);

  @override
  Widget build(BuildContext context) {
    for (int i=0 ; i<baru.length; i++){
      totalPlant += int.parse(baru[i].countPlants);
    }

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              Container(
                  child: new Text("Type of Plant",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0))),
              Container(
                child: new Text("${totalPlant}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avenir',
                        fontSize: 40.0)),
              )
            ],
          )),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: new Text(
                  "\u002B3.13\u0025",
                  style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Avenir',
                      fontSize: 20.0),
                ),
              )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child:
                      Icon(FontAwesomeIcons.longArrowAltUp, color: Colors.red),
                ),
              ),
            ],
          )),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: new Text("East Java",
                    style: const TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Avenir',
                        fontSize: 16.0)),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: Row(children: <Widget>[
                  Container(
                    child: Icon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      child: Text('Maret 2020',
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Avenir',
                              fontSize: 16.0)))
                ]),
              ))
            ],
          ))
        ],
      )),
      decoration: new BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}
