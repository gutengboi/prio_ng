import 'package:flutter/material.dart';
import 'package:prio_ng/components/customButton.dart';
import 'package:prio_ng/components/customButtonAnimation.dart';
import 'package:prio_ng/components/fadeAnimation.dart';
import 'package:prio_ng/screens/loginPage.dart';
import 'package:prio_ng/screens/signUpPage.dart';

import 'dashboard/dashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset("assets/images/phone.jpg", fit: BoxFit.cover),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xFFF001117).withOpacity(0.7),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(top: 80, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FadeAnimation(2.6,Text("PRIO",textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ))),
                        FadeAnimation(2.4,Text("The best for your Utilities",textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.green,
                            fontSize: 10 ,
                            letterSpacing: 2
                        ))),

                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FadeAnimation(2.8,CustomButton(
                          label: "Sign up",
                          background: Colors.transparent,
                          fontColor: Colors.white,
                          borderColor: Colors.white,
                          child: SignUpPage(),
                        )),
                        SizedBox(height: 20),
                        FadeAnimation(3.2,CustomButtonAnimation(
                          label: "Sign In",
                          background: Colors.white,
                          borderColor: Colors.white,
                          fontColor: Color(0xFFF001117),
                          child: LoginPage(),
                        )),
                        SizedBox(height: 30),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
