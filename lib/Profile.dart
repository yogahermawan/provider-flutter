import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User userInfo = User();

  initState() {
    getProfile();
  }

  void getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.get('http://10.28.1.37:3000/api/auth/info',
        headers: {'Authorization': 'Bearer $token'}).then((res) {
      if (res.statusCode == 200) {
        this.setState(() {
          this.userInfo = User.fromJson(json.decode(res.body)); // model
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage('https://raw.githubusercontent.com/yogahermawan/yogahermawan/main/photo_2021-01-10_23-26-34.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '${userInfo.username}',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
    final role = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '${userInfo.role}',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final email = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '${userInfo.email}',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome,role, email, lorem],
      ),
    );

    return Scaffold(
      body: body,
    );
    // return Scaffold(
    //       body
    // child: Column(
    //   children: [
    //     Text('${userInfo.email}'),
    //   ],
    // ),
    // );
  }
}
