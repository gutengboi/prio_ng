import 'package:flutter/material.dart';

class UiMenuModel {
 // String title;
  AssetImage icon;
 // String subtitle;
  Color itemColor;

  //UiMenuModel({this.title, this.icon, this.subtitle, this.itemColor});
  UiMenuModel({this.icon, this.itemColor});
}

List<UiMenuModel> menuItem = [
  UiMenuModel(
      //title: "Courses",
      icon: AssetImage("assets/images/Abuja.jpg"),
      //subtitle: "12",
      itemColor: Colors.white),
  UiMenuModel(
      //title: "Materials",
      icon: AssetImage("assets/images/ikeja.png"),
      //subtitle: "5",
      itemColor: Colors.white),
  UiMenuModel(
      //title: "Project",
      icon: AssetImage("assets/images/kaduna.jpg"),
      //subtitle: "6",
      itemColor: Colors.white),
  UiMenuModel(
      //title: "Online Exam",
      icon: AssetImage("assets/images/jos.jpg"),
      //subtitle: "0",
      itemColor: Colors.white),
  UiMenuModel(
    //title: "Online Exam",
      icon: AssetImage("assets/images/Eko.jpg"),
      //subtitle: "0",
      itemColor: Colors.white),
  UiMenuModel(
    //title: "Online Exam",
      icon: AssetImage("assets/images/ibedc.png"),
      //subtitle: "0",
      itemColor: Colors.white),
  UiMenuModel(
    //title: "Online Exam",
      icon: AssetImage("assets/images/PHED.png"),
      //subtitle: "0",
      itemColor: Colors.white),
  UiMenuModel(
    //title: "Online Exam",
      icon: AssetImage("assets/images/enugu.png"),
      //subtitle: "0",
      itemColor: Colors.white),
  UiMenuModel(
    //title: "Online Exam",
      icon: AssetImage("assets/images/yola.jpg"),
      //subtitle: "0",
      itemColor: Colors.white),
];