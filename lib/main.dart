import 'package:flutter/material.dart';
import 'package:provider/AboutPage.dart';
import 'package:provider/Home.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Routing'),
      ),
      body: 
      // Home()
      Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => AboutPage());
                Navigator.push(context, route);
              },
              child: Text('Contact'),
            ),
            GestureDetector(
              onTap: () {
                Route route =
                    MaterialPageRoute(builder: (context) => AboutPage());
                Navigator.push(context, route);
              },
              child: Container(
                color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                child: const Text('Gesture About'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
