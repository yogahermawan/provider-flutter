import 'package:flutter/material.dart';
import 'package:provider/AboutPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

// Widget button = RaisedButton(
//             onPressed: () {
//               Route route =
//                   MaterialPageRoute(builder: (context) => AboutPage());
//               Navigator.push(context, route);
//             },
//             child: Text('Contact'),
//           )

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // ButtonStyleButton, ContainedButton, ElevatedButton,
          // FlatButton, MaterialButton, OutlineButton,
          // OutlinedButton, RaisedButton, RawMaterialButton, TextButton.
          RaisedButton(
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => AboutPage());
              Navigator.push(context, route);
            },
            child: Text('Contact'),
          )
        ],
      ),
    );
  }
}
