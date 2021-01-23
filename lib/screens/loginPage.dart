import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prio_ng/components//custom_dialog.dart';
import 'package:prio_ng/components/ProgressDialog.dart';

import 'dashboard/dashboard.dart';
import 'dashboard/mainpage.dart';
import 'dashboard/selectPage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  moveToDashboard() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            DashScreen()));
  }

  @override
  Widget build(BuildContext context) {

    double bottom1 = MediaQuery.of(context).viewInsets.bottom;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

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
            //hintText: "Username:",
            labelText: "Username",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0))),
      ),
    );



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
      )
    );



    final loginButon = Container(
      height: 50,
      child:  Material(
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
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white,fontSize: 15, fontWeight: FontWeight.normal)),
        ),
      ),
    );



    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: false,
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/awesome.png"),
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
                SingleChildScrollView(
                  child: Container(
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
                            SizedBox(height: 40.0),

                            new Text("Welcome Back",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10.0),
                            new Text("Login to your account",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(height: 55.0),
                            emailTextField,
                            SizedBox(height: 15.0),
                            passwordTextField,
                            SizedBox(height: 15.0),
                            loginButon,
                            SizedBox(height: 18.0),
                            new Text("Forget Password",
                                textAlign: TextAlign.center,
                                
                                style: style.copyWith(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(height: 15.0),
                          ])),
                ),
                SizedBox(height: 15.0),
                new Text("Don't have an account? SignUp",
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
      {bool close = false, String message = "Please wait..."}) {
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
