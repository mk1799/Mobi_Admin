import 'package:flutter/material.dart';

import '../crud1.dart';

class Add_garage extends StatefulWidget {
  Add_garage({Key key}) : super(key: key);

  @override
  _Add_garageState createState() => _Add_garageState();
}

class _Add_garageState extends State<Add_garage> {
 final formKey = GlobalKey<FormState>();
 String name, adr, phn;
  CRUD1 crudobj = new CRUD1();

  void insert(BuildContext context) {
    
    Map<String, dynamic> data = {
     
      'Name': name,
      'Address': adr,
      'Phone': phn,
      
    };
    crudobj.subData("Garage List",data).then((result) {}).catchError((e) {
      print(e);
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  void submit() async {
    if (validateAndSave()) {
      insert(context);
      Navigator.pop(context,true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: detail()),
            ),
          ],
        ));
  }

  List<Widget> detail() {
    return [
      Padding(padding: EdgeInsets.only(top: 15.0)),
      Center(
          child: Column(
        children: <Widget>[
          Icon(Icons.local_car_wash,
              size: 80.0, color: Colors.blue[700]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Add Garage ",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Detail ",
                style: TextStyle(fontSize: 30.0, color: Colors.black45),
              ),
            ],
          )
        ],
      )),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: ' Name',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              prefixIcon: const Icon(
                Icons.label,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
          
            validator: (value) =>
                value.isEmpty ? "It can't be empty" : null,
            onChanged: (value) => name = value,
          ),
        ),
      ),
      
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: ' Address',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              prefixIcon: const Icon(
                Icons.location_on,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            validator: (value) =>
                value.isEmpty ? "It can't be empty" : null,
            onChanged: (value) => adr = value,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
        child: Card(
          color: Colors.lightBlue[50],
          child: TextFormField(
            decoration: InputDecoration(
              labelText: ' Phone',
              focusColor: Color.fromRGBO(100, 50, 100, 0.8),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.grey[900], fontSize: 20.0),
              prefixIcon: const Icon(
                Icons.call,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            validator: (value) => value.isEmpty ? "It can't be empty" : null,
            onChanged: (value) => phn = value,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.0, left: 100.0, right: 100.0),
        child: Card(
          color: Colors.lightGreen[50],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(150.0)),
          child: Container(
            height: 50.0,
            width: 250.0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(50.0)),
              child: InkWell(
                onTap: () {
                  submit();
                },
                child: Center(
                  child: Text('Add',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ),
              ),
            ),
          ),
        ),
      )
    ];
  
  }
}