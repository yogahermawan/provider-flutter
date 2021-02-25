import 'package:flutter/material.dart';
import 'package:provider/main.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigator.pop(context);
            Route route = MaterialPageRoute(builder: (context) => AboutPage());
            Navigator.push(context, route);
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }
}
