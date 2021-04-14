import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff005daa),
        shadowColor: Colors.black38,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("Blog", textAlign: TextAlign.left)),
      body:Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue[100],Colors.lightBlue[50]]),
              
        ),
      )    
    );
  }
}