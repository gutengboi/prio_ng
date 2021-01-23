import 'package:flutter/material.dart';
import 'package:prio_ng/components/appColor.dart';
import 'package:prio_ng/components/uiMenuModel.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(":::::::test::::::");
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 100;
    var _aspectRatio = _width / cellHeight;

    return Container(
      color: Colors.lightGreen,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              // Container(
              //   alignment: Alignment.topRight,
              //   margin: EdgeInsets.only(right: 20),
              //   child: Container(
              //     width: 40,
              //     height: 40,
              //     decoration: BoxDecoration(
              //       color: Colors.transparent,
              //       borderRadius: BorderRadius.circular(40.0),
              //       border: Border.all(
              //           color: Colors.white.withOpacity(0.69),
              //           width: 1,
              //           style: BorderStyle.solid),
              //     ),
              //     alignment: Alignment.center,
              //     // child: ClipRRect(
              //     //   borderRadius: BorderRadius.circular(40.0),
              //     //   child: Image.asset("images/pf.png",
              //     //       width: 40,
              //     //       height: 40,
              //     //       fit: BoxFit
              //     //           .contain), //Image.asset("images/icons/Profile.png"),
              //     // ),
              //   ),
              // ),
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 25),
                  child: Text("Select Your Disco",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color:Colors.white,
                      ))),
              SizedBox(height: 0),
              // Container(
              //     alignment: Alignment.centerLeft,
              //     margin: EdgeInsets.only(left: 25),
              //     child: Text("Akinbande",
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.normal,
              //             color:Colors.black))),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    childAspectRatio: _aspectRatio,
//                  crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 30.0,
                  ),
                  itemCount: menuItem.length,
                  itemBuilder: (context, index) {
                    return menus(menuItem[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              //notificationBanner(),
              SizedBox(height: 30),
              // Container(
              //     margin: EdgeInsets.only(left: 30, right: 20),
              //     alignment: Alignment.centerLeft,
              //     child: Text("Last seen classes",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500))),
              SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }

  Widget menus(UiMenuModel menuItem) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        color: menuItem.itemColor,
        //alignment: Alignment.center,
        elevation: 4,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Container(
                  color: menuItem.itemColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text("${menuItem.subtitle}",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 17,
                      //         fontWeight: FontWeight.w500)),
                      // Text("${menuItem.title}",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 50,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 3, color: Colors.black)
                  ),
                  alignment: Alignment.center,
                  child: Image(
                    image: menuItem.icon,
                    width: 100,
                    height: 100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Widget notificationBanner() {
//   return Container(
//     decoration: BoxDecoration(
//         image: DecorationImage(
//           image:
//           AssetImage("images/notificationBg.png"), // ;imageDirectory[0]),
//           fit: BoxFit.fill,
//         ),
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10),
//             // bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10))),
//     margin: EdgeInsets.only(left: 30, right: 30),
//     height: 70,
//     width: double.infinity,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Expanded(
//             flex: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Color(0xFF00AEAE),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     bottomLeft: Radius.circular(5),
//                   )),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     "images/bell.png",
//                     width: 15,
//                     height: 15,
//                     color: Colors.white,
//                   ),
//                   Text("10:30",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 9,
//                           fontWeight: FontWeight.w500)),
//                   Text("20/6/2020",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 9,
//                           fontWeight: FontWeight.w500))
//                 ],
//               ),
//             )),
//         Expanded(
//             flex: 4,
//             child: Container(
//               color: AppColors.primary.withOpacity(0.78),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Upcoming Class",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500)),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text("BFN209 - Introduction to Finance",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 8,
//                           fontWeight: FontWeight.w500)),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   Text("Lecturer - Prof, Adeniyi Olushola",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 8,
//                           fontWeight: FontWeight.w500))
//                 ],
//               ),
//             )),
//         Expanded(
//           flex: 1,
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: AppColors.primary.withOpacity(0.78),
//             child: Container(
//               margin: EdgeInsets.all(10),
//               child: Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     border: Border.all(color: Colors.white, width: 3)),
//                 child: Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(color: Colors.white, width: 3)),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget lastSeenClassesWidget() {
//   return Container(
//     decoration: BoxDecoration(
//         color: Color(0xFFF2FBFE),
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10),
//             // bottomLeft: Radius.circular(10),
//             bottomRight: Radius.circular(10))),
//     margin: EdgeInsets.only(left: 30, right: 30),
//     height: 70,
//     width: double.infinity,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         SizedBox(
//           width: 10,
//         ),
//         Container(
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(right: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Image.asset("images/pf.png",
//               width: 40, height: 40, fit: BoxFit.contain),
//         ),
//         Expanded(
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text("Human circle Management",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500)),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text("Prof, Johnson Adewole",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 8,
//                           fontWeight: FontWeight.w500)),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   Text("1hour, 25 min",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 8,
//                           fontWeight: FontWeight.w500))
//                 ],
//               ),
//             )),
//         Container(
//           width: 50,
//           height: double.infinity,
//           alignment: Alignment.center,
//           child: Image(
//             image: AssetImage("images/play.png"),
//             width: 25,
//             height: 25,
//           ),
//         )
//       ],
//     ),
//   );
// }
}
