import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/AboutPage.dart';
import 'package:provider/Dashboard.dart';
import 'package:provider/Home.dart';
import 'package:provider/Login.dart';
import 'package:provider/LoginPage.dart';

// https://github.com/yogahermawan/provider-flutter

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (message) async {
        setState(() {
          messageTitle = message["notification"]["title"];
          notificationAlert = "New Notification Alert";
        });
      },
      onResume: (message) async {
        setState(() {
          messageTitle = message["data"]["title"];
          notificationAlert = "Application opened from Notification";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Belajar Routing'),
  //     ),
  //     body:
  //         // Home()
  //         Container(
  //       child: Column(
  //         children: [
  //           TextButton(
  //             onPressed: () {
  //               Route route =
  //                   MaterialPageRoute(builder: (context) => AboutPage());
  //               Navigator.push(context, route);
  //             },
  //             child: Text('Contact'),
  //           ),
  //           GestureDetector(
  //             onTap: () {
  //               Route route =
  //                   MaterialPageRoute(builder: (context) => AboutPage());
  //               Navigator.push(context, route);
  //             },
  //             child: Container(
  //               color: Colors.yellow.shade600,
  //               padding: const EdgeInsets.all(8),
  //               child: const Text('Gesture About'),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
