import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cardScreen.dart';
import 'mainpage.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  var screens = [
    MainPage(),
    CardScreen(),

  ]; //screens for each tab

  var scaffoldKey  =  GlobalKey<ScaffoldState>();
  int selectedTab = 0;

  @override
  Widget build1(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.green,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.green),
                title: Text("Home")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.green),
                title: Text("Profile")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card, color: Colors.green),
                title: Text("Card")
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: Colors.green),
                title: Text("Settings")
            ),
          ],
          onTap: (index){
            setState(() {
              selectedTab = index;
            });
          },
          showUnselectedLabels: true,
          iconSize: 30,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){},
        //   elevation: 0,
        //   child: Icon(Icons.add),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: screens[selectedTab],

      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () async {
          return  false;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.green,
          //appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  title: Text("Home")
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.green),
                  title: Text("Profile")
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card, color: Colors.green),
                  title: Text("Card")
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Colors.green),
                  title: Text("Settings")
              ),
            ],
            onTap: (index){
              setState(() {
                selectedTab = index;
              });
            },
            showUnselectedLabels: true,
            iconSize: 30,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 25),
              child: screens[selectedTab])
//              body: PageStorage(bucket: pageStorageBucket, child: _children[_currentIndex]),
        ),
      ),
    );
  }
}