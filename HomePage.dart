import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_helloworld/controller/navigations/nestleTab/HomeTopTabs.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Color PrimaryColor = Color(0xff109618);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: _GooglePlayAppBar(),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            onTap: (index){
              setState(() {
                switch (index) {
                  case 0:
                    PrimaryColor = Color(0xffff5722);
                    break;
                  case 1:
                    PrimaryColor = Color(0xff3f51b5);
                    break;
                  case 2:
                    PrimaryColor = Color(0xffe91e63);
                    break;
                  case 3:
                    PrimaryColor = Color(0xff9c27b0);
                    break;
                  case 4:
                    PrimaryColor = Color(0xff2196f3);
                    break;
                  default:
                }
              });
            },
            tabs: <Widget>[
              Tab(
                child: Container(
                  child: Text(
                    'HOME',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)
                  )
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'GAMES',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)
                  )
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'MOVIES',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)
                  )
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'BOOK',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)
                  )
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'MUSIC',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)
                  )
                ),
              )
            ]
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeTopTabs(0xffff5722),
            Container(color:  Color(0xff3f51b5)),
            Container(color: Color(0xffe91e63)),
            Container(color: Color(0xff9c27b0)),
            Container(color: Color(0xff2196f3))
          ]
          )
      )
    );
  }
}

Widget _GooglePlayAppBar(){
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(icon: Icon(FontAwesomeIcons.bars),)
        ),
        Container(
          child: Text('Google Play', style: TextStyle(color: Colors.grey)),
        ),
        Container(
          child: IconButton(icon: Icon(FontAwesomeIcons.microphone, color: Colors.blueGrey,), onPressed: null),
        )
      ]
    ),
  );
}
