import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prio_ng/components/custom_dialog.dart';
import 'package:prio_ng/components/ProgressDialog.dart';
import 'package:prio_ng/screens/loginPage.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  moveToDashboard() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final userNameTextField = Container(
    height: 45,
    child:  TextField(
    keyboardType: TextInputType.name,
    controller: userNameController,
    obscureText: false,
    style: style,
    onChanged: (value){

      },
      decoration: InputDecoration(
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username:",
          labelText: "Username",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0))),
    ));

    final emailTextField = Container(
        height: 45,
        child:  TextField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          obscureText: false,
          style: style,
          onChanged: (value){

      },
      decoration: InputDecoration(
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email:",
          labelText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0))),
    ));

    final passwordTextField = Container(
    height: 45,
    child: TextField(
    keyboardType: TextInputType.visiblePassword,
    controller: passwordController,
    obscureText: true,
    style: style,
    onChanged: (value){

      },
      decoration: InputDecoration(
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password:",
          labelText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0))),
    ));

    final signUpButton =  Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          showLoading(context);
          //Api call
          Timer timerM =  new Timer.periodic(new Duration(seconds: 5), (time) {
            Navigator.of(context).pop();
            moveToDashboard();
            time.cancel();
          });
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) => CustomDialog(
          //     title: "Success",
          //     description:
          //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          //     buttonText: "Okay",
          //     btnPressed: null,
          //   ),
          // );
          // if (1 == 1) {
          //   Route route = MaterialPageRoute(
          //       builder: (context) => DashboardPage());
          //   Navigator.push(context, route);
          // } else {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) => CustomDialog(
          //       title: "Success",
          //       description:
          //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          //       buttonText: "Okay",
          //       btnPressed: null,
          //     ),
          //   );
          // }
        },
        child: Text("SignUp",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.normal)),
      ),
    );


    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/student.png"),
                  fit: BoxFit.cover,
                )),
          ),
          new Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    ),
                    height: 400, //  (height * 0.50),
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          new Text("Welcome Back",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 9.0),
                          new Text("Login to your account",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                          SizedBox(height: 27.0),
                          userNameTextField,
                          SizedBox(height: 11.0),
                          emailTextField,
                          SizedBox(height: 11.0),
                          passwordTextField,
                          SizedBox(height: 25.0),
                          signUpButton,
                          SizedBox(height: 11.0),
                        ])),
                SizedBox(height: 15.0),
                new Text("Already have an account? Login",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
                SizedBox(height: 10.0),
              ],
            ),
          )
        ],
      ),
    );


  }
  void showLoading(BuildContext context,
      {bool close = false, String message = "Signing Up..."}) {
    if (close) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      SuccessDialog.show(
        context,
        WillPopScope(
          onWillPop: () async => false,
          child: DialogLoading(
            subtitle: Container(
              child: Text(
                message,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }
}