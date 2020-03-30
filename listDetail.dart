import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_helloworld/model/datamodel.dart';

List<Widget> listDetail(List<plants> plantInput) {
  List<Widget> baru = new List();
  for (int i = 0; i < plantInput.length; i++) {
    baru.add(myDetail(plantInput[i].typePlants, plantInput[i].countPlants,
        plantInput[i].presetanse, plantInput[i].condition));
  }
  return baru;
}

Widget myDetail(String CurrencyName, String currencyValue,
    String currencyPersentase, String currencyStatus) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.white,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(16.0),
      shadowColor: Colors.green[200],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: myCurrencies(
            CurrencyName, currencyValue, currencyPersentase, currencyStatus),
      ),
    ),
  );
}

Center myCurrencies(String nameCountry, String currencyVal,
    String currencyPercentage, String currencyStatus) {
  return Center(
      child: Column(children: <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        myLeadingDetail(nameCountry),
        myCurrenciesDetail(currencyVal, currencyPercentage, currencyStatus),
      ],
    )
  ]));
}

Widget myLeadingDetail(String nameCountry) {
  return Container(
      child: Row(
    children: <Widget>[
      Container(
        child: new CircleAvatar(
          backgroundColor: Colors.green[500],
          child: Icon(FontAwesomeIcons.tree, color: Colors.white),
        ),
      ),
      SizedBox(width: 10),
      Container(
        child: Text(
          nameCountry,
          style: TextStyle(
              color: Colors.green[900],
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
        ),
      )
    ],
  ));
}

Widget myCurrenciesDetail(
    String currencyValue, String currencyPersentase, String currencyStatus) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        child: Text(
          "${currencyValue} Plants",
          style: TextStyle(
              color: Colors.green[900], fontFamily: 'Avenir', fontSize: 16.0),
        ),
      ),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "${currencyStatus}" == "up" ? "+${currencyPersentase}\u0025\u0020"  : "-${currencyPersentase}\u0025\u0020"  
            ,
              style: TextStyle(
                color: Colors.green[500],
                fontFamily: 'Avenir',
                fontSize: 14.0,
              )
          ),
          Icon("${currencyStatus}" == "up" ? FontAwesomeIcons.longArrowAltUp  : FontAwesomeIcons.longArrowAltDown,
          color: "${currencyStatus}" == "up" ? Colors.red  : Colors.blue  
          )

        ],
      ))
    ],
  ));
}
