import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_helloworld/controller/login.dart';
import 'controller/attr.dart';

class IntroSlideAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 0),
        child: CarouselSlider(
          autoPlay: false,
          enableInfiniteScroll: false,
          initialPage: 0,
          reverse: false,
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          items: [0, 1, 2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    color: bgColor,
                    child: introSlide(i));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class introSlide extends StatefulWidget {
  int index;
  introSlide(this.index);

  @override
  _introSlideState createState() => _introSlideState();
}

class _introSlideState extends State<introSlide> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    color: _colorFromHex(colorBackground),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: <Widget>[
                      Positioned(
                          left: 16,
                          top: 16,
                          child: Text("Numero\u00B9", style: _titleStyle())),
                      Positioned(
                          right: 16,
                          top: 16,
                          child: new Text(widget.index == 2 ? "DONE" : "SKIP",
                              style: _titleStyle())),
                    ]),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    color: _colorFromHex(colorBackgroundTwo),
                      child: Center(
                          child: Image.asset(
                imagePath[widget.index],
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 1.5,
              )))),
              Expanded(
                child: Container(
                    color: _colorFromHex(colorBackgroundTwo),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: Center(
                            child: new Text(
                          title[widget.index],
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(

                
                        margin: EdgeInsets.only(top: 24),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: new RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: description[widget.index],
                                    style: new TextStyle(fontFamily: 'Avelin'))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: _colorFromHex(colorBackground),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Stack(children: <Widget>[
                    DotsIndicators(widget.index),
                    Center(
                        child: new Text(
                      widget.index != 2 ? 'SCROLL RIGHT' : '',
                      style: TextStyle(fontFamily: "Avelir", fontSize: 10),
                    )),
                    Positioned(
                        top: widget.index != 2 ? 36 : 0,
                        right: 0,
                        child: widget.index != 2
                            ? Image.asset(
                                'assets/images/arrow.png',
                                width: 30,
                              )
                            : LetsGo())
                  ]),
                ),
              ),
            ]),
      ),
    );
  }
}

class DotsIndicators extends StatefulWidget {
  int pageIndex;
  DotsIndicators(this.pageIndex);
  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();
}

class _DotsIndicatorsState extends State<DotsIndicators> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, int index) {
        return Container(
          margin: EdgeInsets.only(right: index != 2 ? 4 : 0),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              color: index == widget.pageIndex
                  ? Colors.black
                  : bgColor), //make small crycle with border black and color white
        );
      },
    );
  }
}

class LetsGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginClass()));
        },
        child: new Text("Click Here", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}

//Color 
Color bgColor = Color(0xFFF3F3F3);
Color textColor = Color(0xFF83838A);
var colorBackground = "e5eefa";
var colorBackgroundTwo = "edf4fc";

//List Image in Slider
List<String> imagePath = [
  "assets/images/introSlideOne.png",
  "assets/images/introSlideTwo.png",
  "assets/images/introSlideThree.png",
];

//List Title in Slide
List<String> title = ["Welcome Plants", "Care for Plants", "Ready To Plant a Tree"];

//List Description in SLide
List<String> description = [
  "Plants are one source of oxygen and absorbing carbon dioxide",
  "Plant plants in your house besides reducing global warming, your house will be more beautiful",
  "Do not have many plans to wait let alone directly plant flowers in front of the house, do not require high power is not it"
];

//Text Style Text
TextStyle _titleStyle() {
  final titleStyle = TextStyle(
      fontFamily: "AvenirNextLTPro-Regular",
      fontSize: 16,
      fontWeight: FontWeight.bold);
  return titleStyle;
}

//Convert Hex to Colors
Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
