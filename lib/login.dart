import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobi_admin/home.dart';
import 'package:mobi_admin/ride/crride.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool _toggleVisibility = true;
  final txt = TextEditingController();
  final txt1 = TextEditingController();

  void submit() async {
    print("In Submit!!!");
    print(_email);
    if (_email == "mobi@admin.in" && _password == "mobiadmin") {
      print("In IF!!");
      Navigator.pop(context);
      var route =
          new MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).push(route);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Thanks"),
              content: new Text("Something went Wrong \n please Try Again!!"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      txt.clear();
      txt1.clear();
    }
  }

  String validateName(String value) {
    if (value.length == 0) {
      return 'Password can\'t be empty!';
    } else {
      if (value.length < 8)
        return 'Password must be more than 7 charater';
      else
        return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return 'Email can\'t be empty!';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter Valid Email';
      else
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aset/r2.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
    //  resizeToAvoidBottomPadding: false,
      child: ListView(
        children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:30,right: 100.0, left: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Mobi',
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Lyft',
                        style: TextStyle(
                            fontSize: 40.0, color: Colors.amberAccent[700]),
                      )
                    ],
                  ),
                ),
                 
                      Icon(Icons.person,
                          size: 100.0, color: Colors.orange[300]),
                   Center(
                                        child: Text(
                          'Admin',
                          style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.cyan[200],
                              fontWeight: FontWeight.bold),
                        ),
                   ),
                
                
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    right: 10.0,
                    left: 10.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                   // color: Colors.amber,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, right: 20.0, left: 10.0),
                          child: Card(
                            color: Colors.blueGrey[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(150.0)),
                            child: TextFormField(
                              
                              // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              style: TextStyle(
                                  color: Colors.black, fontSize:25.0),
                              controller: txt,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20)
                              ],
                              
                              decoration: InputDecoration(
                                hoverColor: Colors.black,
                                focusColor: Colors.black12,
                                
                                border: InputBorder.none,
                                hintText: ' Email',
                                hintStyle: TextStyle(color: Colors.black54),
                                //focusColor: Colors.grey,
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                                prefixIcon: Padding(
                                  child: const Icon(
                                    Icons.mail,
                                    size: 40.0,
                                    color: Colors.teal,
                                  ),
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                ),
                              ),
                              validator: (value) => validateEmail(value),
                              onChanged: (value) => _email = value,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5.0, right: 20.0, left: 10.0),
                          child: Card(
                            color: Colors.blueGrey[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(150.0)),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0),
                              //maxLength: 15,
                              maxLengthEnforced: true,
                              controller: txt1,
                              decoration: InputDecoration(
                                
                                hintText: ' Password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.black54),
                                focusColor: Color.fromRGBO(255, 0, 0, 0.8),
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 25.0),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Icon(
                                    Icons.vpn_key,
                                    size: 40.0,
                                    color: Colors.teal,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 0),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _toggleVisibility = !_toggleVisibility;
                                      });
                                    },
                                    icon: _toggleVisibility
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),
                                ),
                              ),
                              obscureText: _toggleVisibility,
                              validator: (value) => validateName(value),
                              onChanged: (value) => _password = value,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.0, left: 100.0, right: 100.0),
                          
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: InkWell(
                                onTap: () {
                                  submit();
                                },
                                child: Center(
                                  child: Text('Login',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                          
                        ),
                        SizedBox(
                          height:10.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
