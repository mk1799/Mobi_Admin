import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../crud1.dart';

class CurRide extends StatefulWidget {
  CurRide({Key key}) : super(key: key);

  @override
  _CurRideState createState() => _CurRideState();
}

class _CurRideState extends State<CurRide> {
 CRUD1 crudobj = new CRUD1();
  QuerySnapshot ride;
  String _src, _dest, _seat;
  @override
  void initState() {
    crudobj.getData('ride request').then((result) {
      setState(() {
        ride = result;
      });
    });
  }

  int l = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          if (ride != null)
            for (int i = 0; i < ride.documents.length; i++)
              Column(
                children: <Widget>[
                  returnride(i),
                ],
              ),
          Padding(padding: EdgeInsets.only(top: 250.0)),
          if (ride == null)
            Column(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            )
        ],
      ),
    );
  }


  Widget returnride(int i) {
    if (ride != null) {
        return Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Card(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 50.0,
                  ),
                  title: Text(
                      "${ride.documents[i].data["PickUp"]}\tto\t${ride.documents[i].data["Destination"]}",style: TextStyle(fontSize: 20.0),),
                  subtitle: Text("Creator : "
                      "${ride.documents[i].data["Emailcr"]}\nRequester:${ride.documents[i].data["Emailreq"]}\nTime: ${ride.documents[i].data["Time"]}", style: TextStyle(fontSize: 15.0),),
                  trailing: IconButton(
                      icon: Icon(Icons.delete_forever, color: Colors.blue),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                child: Text(
                                  'Are you sure to delete?',
                                  style: TextStyle(
                                    fontFamily: 'helvetica_neue_light',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                              
                              actions: <Widget>[
                               
                                FlatButton(
                                  child: Text('    Delete    ',
                                      style: TextStyle(fontSize: 20.0)),
                                  onPressed: () {
                                    //Navigator.of(context).pop();

                                    crudobj.deleteData(
                                        ride.documents[i].documentID,"ride request");
                                    Navigator.pop(context, true);
                                    Navigator.pop(context, true);
                                  },
                                ),
                                FlatButton(
                                  child: Text('Cancel',
                                      style: TextStyle(fontSize: 20.0)),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }),
                )));
    }
     else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}