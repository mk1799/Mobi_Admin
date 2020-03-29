import 'package:flutter/material.dart';
import 'package:mobi_admin/carservice/add.dart';
import 'package:mobi_admin/carservice/registered.dart';

class Service extends StatefulWidget {
  Service({Key key}) : super(key: key);

  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aset/r4.jpg"),
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
                            "Registered Garage",
                            style:
                                TextStyle(color: Colors.lightBlue[100], fontSize: 30.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Reggar()
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
                              "Add New Garage",
                              style: TextStyle(
                                  color: Colors.lightBlue[100], fontSize: 30.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      Add_garage()
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
