import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobi_admin/carsell/sell.dart';
import 'package:mobi_admin/feedback.dart';
import 'package:mobi_admin/ride/ridepage.dart';
import 'package:mobi_admin/user.dart';
import 'package:mobi_admin/carservice/car_service.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aset/r1.jpg"),
            fit: BoxFit.cover,
          ),
          ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.0, left: 10, right: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            
                              
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        height: 140.0,
                        width: 160.0,
                        child: RaisedButton(
                          color: Colors.transparent,
                          child: Center(child: Text("Ride",style:TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: "Horizon",
                              ),textAlign: TextAlign.center,)) ,
                            
                              
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RidePage()));
                          },
                          // shape: CircleBorder()
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 140.0,
                        width: 160.0,
                        child: RaisedButton(
                          color: Colors.transparent,
                          child:Center(child: Text("Car Rent",style:TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: "Horizon",
                              ),textAlign: TextAlign.center,)) ,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Home()));
                          },
                          // shape: CircleBorder()
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 140.0,
                          width: 160.0,
                          child: RaisedButton(
                            color: Colors.transparent,
                            child: Center(child: Text("Car Service",style:TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: "Horizon",
                              ),
                              textAlign: TextAlign.center,)) ,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => Service()  ));
                            },
                            // shape: CircleBorder()
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 140.0,
                          width: 160.0,
                          child: RaisedButton(
                            color: Colors.transparent,
                            child: Center(child: Text("Car sell",style:TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: "Horizon",
                              ),textAlign: TextAlign.center,)) ,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SellPage()));
                            },
                            // shape: CircleBorder()
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 140.0,
                          width: 160.0,
                          child: RaisedButton(
                            color: Colors.transparent,
                            child: Center(child: Text("Feedback",style:TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: "Horizon",
                              ),textAlign: TextAlign.center,)) ,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                        FeedBack()  ));
                            },
                            // shape: CircleBorder()
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 140.0,
                          width: 160.0,
                          child: RaisedButton(
                            color: Colors.transparent,
                            child: Center(child: Text("Users",style:TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: "Horizon",
                              ),textAlign: TextAlign.center,)) ,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          User()));
                            },
                            // shape: CircleBorder()
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
