import 'package:flutter/material.dart';
import 'package:test_helloworld/controller/navigations/plant/plantAppBarController.dart';
import 'package:test_helloworld/controller/navigations/plant/plantFlexibleAppBarController.dart';
import 'package:test_helloworld/controller/navigations/plant/plantListController.dart';
import 'package:test_helloworld/model/datamodel.dart';

class planController extends StatefulWidget {
  var plantCountry = new  List<plants>();
  planController({Key key, this.plantCountry}) : super(key: key);

  @override
  _planControllerState createState() => _planControllerState();
}

class _planControllerState extends State<planController> {
   var plantCountry = new  List<plants>();
  @override
  Widget build(BuildContext context) {
    plantCountry.clear();
    plantCountry.add(plants(typePlants: 'Apple', countPlants:'232', presetanse:"0.005", condition: "up" ),);
    plantCountry.add(plants(typePlants: 'Melon', countPlants:'435', presetanse:"0.055", condition: "up" ),);
    plantCountry.add(plants(typePlants: 'Water Melon', countPlants:'675', presetanse:"0.0435", condition: "up" ),);
    plantCountry.add(plants(typePlants: 'Banana', countPlants:'134', presetanse:"0.004", condition: "down" ),); 
    plantCountry.add(plants(typePlants: 'Manggo', countPlants:'232', presetanse:"0.0125", condition: "up" ),);
    plantCountry.add(plants(typePlants: 'Orange', countPlants:'445', presetanse:"0.01", condition: "down" ),);
    plantCountry.add(plants(typePlants: 'Strawberry', countPlants:'345', presetanse:"0.0425", condition: "up" ),);
    plantCountry.add(plants(typePlants: 'Guava', countPlants:'644', presetanse:"0.0454", condition: "up" ),); 
    plantCountry.add(plants(typePlants: 'Srikaya', countPlants:'986', presetanse:"0.032", condition: "down" ),);
    plantCountry.add(plants(typePlants: 'Chocolatte', countPlants:'145', presetanse:"0.0425", condition: "up" ),);
    plantCountry.add(plants(typePlants: 'Carrot', countPlants:'964', presetanse:"0.0454", condition: "up" ),); 
    plantCountry.add(plants(typePlants: 'Singkong', countPlants:'234', presetanse:"0.04", condition: "down" ),); 

    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        automaticallyImplyLeading: false,
        title: plantAppBarController(),
        pinned: true,
        expandedHeight: 210.0,
        flexibleSpace: FlexibleSpaceBar(
          background: plantFexibleAppBarController(this.plantCountry),
        ),
      ),
      SliverList(delegate: SliverChildListDelegate(
        listDetail(plantCountry) 
        )
      )
    ]));
  }
}
