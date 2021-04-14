import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xff005daa),
        shadowColor: Colors.black38,
          automaticallyImplyLeading: false,
          title: new Center(
            child: new Text("Media", textAlign: TextAlign.left),
          ),
        ),
      backgroundColor: Colors.red,
      body:Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue[100],Colors.lightBlue[50]]),
        ),));
  }
}