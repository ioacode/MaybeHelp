import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeForYouTabs extends StatefulWidget {
  final Widget child;

  HomeForYouTabs({Key key, this.child}) : super(key: key);

  @override
  _HomeForYouTabsState createState() => _HomeForYouTabsState();
}

class _HomeForYouTabsState extends State<HomeForYouTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 10.0),
          ImageContainer(),
          SizedBox(height: 20.0),
          InstalledApps()
        ],
      ),
    );
  }
}

Widget ImageContainer(){
  return Container(
    height: 200.0,
    child: Image.asset('assets/images/marverbackground.png', fit: BoxFit.cover),
  );
}

Widget InstalledApps(){
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: labelContainer('Previously installed apps'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: appRecommendedContainer() ,
        )
      ]
    )
  );
}

Widget labelContainer(String labelVal){
  return Container(
    height: 30.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          labelVal,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Text(
          'MORE',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18.0),
        )
      ]
    ),
  );
}

Widget appRecommendedContainer(){
  return  Container(
    height: 160.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        imageSection(
                'assets/images/populerone.webp',
                'Amazon Kindle','4.2'),
                SizedBox(width: 10.0),
                imageSection(
                'assets/images/populertwo.webp',
                'Audible','4.5'),
                 SizedBox(width: 10.0),
                imageSection(
                'assets/images/populerthree.webp',
                'Skype','4.1'),
                 SizedBox(width: 10.0),
                imageSection(
                'assets/images/populerfour.webp',
                'Google Docs','4.1'),
       
      ],
    )
  );
}

Widget imageSection(String imageVal, String appVal, String rateVal){
  return Column(
    children: <Widget>[
      Container(
        height: 100.0,
        width: 100.0,
        child: Image.asset(imageVal, fit: BoxFit.cover,) 
      ),
      SizedBox(height: 10.0),
      Text(
        appVal,
        style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      SizedBox(height: 10.0),
      Row(
        children: <Widget>[
          Text(
            rateVal,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Icon(FontAwesomeIcons.solidStar, size: 10.0,)
        ]
      )
    ],
  );
}


