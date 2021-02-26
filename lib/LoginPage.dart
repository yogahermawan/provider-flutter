import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/Dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:provider/model/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = 'http://10.28.1.37:3000/api/auth/signin';
    if (formKey.currentState.validate()) {
      http.post(url, body: {
        "username": usernameController.text,
        "password": passwordController.text
      }).then((res) {
        final data = json.decode(res.body);
        print(res.body);
        if (res.statusCode == 200) {
          prefs.setString('token', data['accessToken']);
          Navigator.pushAndRemoveUntil(
              context,
              //mengarah ke dashboard
              MaterialPageRoute(builder: (context) => MyApp()),
              (Route<dynamic> route) => false);
        } else {
          SnackBar(
            content: new Text(
              data['message'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffff322d),
                  fontSize: 16.0,
                  fontFamily: "WorkSansSemiBold"),
            ),
            backgroundColor: Color(0xffffe5e0),
            duration: Duration(seconds: 3),
          );
        }
      }).catchError((e) {
        //widget handle error
        SnackBar(
          content: new Text(
            e,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffff322d),
                fontSize: 16.0,
                fontFamily: "WorkSansSemiBold"),
          ),
          backgroundColor: Color(0xffffe5e0),
          duration: Duration(seconds: 3),
        );
        print(e);
      });
    }
  }

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: Image.asset("/graphics/splash.jpg"),
              ),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Form(
        key: formKey,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              validator: (value) {
                return value.isEmpty ? "Username Tidak Boleh Kosong" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              validator: (value) {
                return value.isEmpty ? "Password tidak boleh kosong" : null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5)),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          RaisedButton(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, color: Colors.lightBlue),
                ),
              ),
            ),
            onPressed: () {
              _login();
              // print(formKey.currentState.validate());
              // print(usernameController.text.toString());
              // if (formKey.currentState.validate() &&
              //     usernameController.text.toString() == email &&
              //     passwordController.text.toString() == password
              //     ) {
              //   Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(builder: (context) => MyApp()),
              //       (Route<dynamic> route) => false);
              // }
            },
          )
        ]));
  }
}
