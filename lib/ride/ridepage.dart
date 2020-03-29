import 'package:flutter/material.dart';
import 'package:mobi_admin/ride/crride.dart';
import 'package:mobi_admin/ride/curride.dart';

class RidePage extends StatefulWidget {
  RidePage({Key key}) : super(key: key);

  @override
  _RidePageState createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aset/r9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
               //  mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 100.0,
                      width: 310.0,
                      child: RaisedButton(
                          color: Colors.transparent,
                          child: Text(
                            "Added Ride",
                            style:
                                TextStyle(color: Colors.tealAccent[400], fontSize: 35.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => CrRide()
                                    ));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0)))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        height: 100.0,
                        width: 310.0,
                        child: RaisedButton(
                            color: Colors.transparent,
                            child: Text(
                              "Current Ride",
                              style: TextStyle(
                                  color: Colors.tealAccent[400], fontSize: 35.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      CurRide()
                                      ));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(50.0)))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ],
          ),
    );
  }
}