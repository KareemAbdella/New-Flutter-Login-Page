import 'package:flutter/material.dart';
import 'package:login/ui/Loginpage.dart';

class Login extends StatelessWidget {
  final appTitle = "Login Page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTitle,

        ),
        centerTitle: true,

      ),
      backgroundColor: Colors.blueGrey,
      body: LoginPage(),
    );
  }
}


