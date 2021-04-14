import 'package:flutter/material.dart';

class MemberAccount extends StatefulWidget {
  @override
  _MemberAccountState createState() => _MemberAccountState();
}

class _MemberAccountState extends State<MemberAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff005daa),
        shadowColor: Colors.black38,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title:  new Text("Account Info", textAlign: TextAlign.left)),
    );
  }
}