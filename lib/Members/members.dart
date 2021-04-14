import 'package:flutter/material.dart';
import 'package:rotary/Members/accounts.dart';



class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    //icon: Icon(Icons.contacts, size: 30.0),
    title: 'Member1',
    subtitle: "Account Information",
  ),
  
];


class Members extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MembersState();
  }
}

class _MembersState extends State<Members> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xff005daa),
        shadowColor: Colors.black38,
          automaticallyImplyLeading: false,
          title: new Center(
            child: new Text("Members", textAlign: TextAlign.left),
          ),
        ),
      backgroundColor: Colors.red,
      body: Container(
        color: Colors.black,
        child: _Member(),
      ),
    );
  }

}

class _Member extends StatefulWidget {


  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<_Member> {  
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue[100],Colors.lightBlue[50]]),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            } else if (index == options.length + 1) {
              return SizedBox(height: 100.0);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: _selectedOption == index - 1
                    ? Border.all(color: Colors.black26)
                    : null,
              ),
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Color(0xff01b4e7),
                    child: Text('M'),
                ),
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                        ? Colors.black
                        : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  options[index - 1].subtitle,
                  style: TextStyle(
                    color:
                        _selectedOption == index - 1 ? Colors.black : Colors.grey,
                  ),
                ),
                selected: _selectedOption == index - 1,
                onTap: () {
                  setState(() {
                    _selectedOption = index - 1;
                    print(index);
                    if (index == 1) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => MemberAccount()));
                    } 
                  },);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

