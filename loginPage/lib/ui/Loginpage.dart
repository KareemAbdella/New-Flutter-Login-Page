import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Data Class

class _Logindata {
  String name = "";
  String pass = "";
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  _Logindata _data = new _Logindata();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/EVE-icon.png",
              width: 90,
              height: 90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(3.3))),
              validator: (value) {
                final user = value;
                if (value.isEmpty)
                  return " Please Enter Username";
                else {
                  print("all is good");
                  _data.name = user;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.none,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                    gapPadding: 10, borderRadius: BorderRadius.circular(3.3)),
              ),
              validator: (user) {
                if (user.isEmpty)
                  return " Please Enter Pass";
                else {
                  print("all is Good");
                  _data.pass = user;
                }
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _data.name = _data.name;
                          _data.pass = _data.pass;
                        });
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("All is ${_data.name}")));
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.reset();
                        setState(() {
                          _data.name = "";
                        });
                      }
                    },
                    child: Text("Clear"),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _data.name.isEmpty
                  ? Text("")
                  : Text(
                      "Welcome ${_data.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
