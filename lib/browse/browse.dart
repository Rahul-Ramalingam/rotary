import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:rotary/Members/members.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black38,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Deeds",style:TextStyle(color:Color(0xff005daa),fontWeight:FontWeight.w900,letterSpacing:1,fontSize:22)),
          leading: IconButton(icon:Icon(Icons.menu),onPressed:(){},color: Colors.grey,),
          actions: [Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(icon:Icon(Icons.notifications),onPressed:(){},color: Colors.grey,),
          )],
        ),
        body: Container(
        color: Colors.black,
        child: _browser(),),
    );
  }
}

class _browser extends StatefulWidget {
  @override
  __browserState createState() => __browserState();
}

class __browserState extends State<_browser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue[50],Colors.lightBlue[50]]),
              
        ),
        child:Stack(children:[
                  Container(
                    height: 220,
                    child: Carousel(
                      boxFit: BoxFit.fill,
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 1000),
                      dotSize: 4.0,
                      dotIncreasedColor: Colors.white,
                      dotBgColor: Colors.transparent,
                      dotPosition: DotPosition.bottomCenter,
                      dotVerticalPadding: 10.0,
                      showIndicator: true,
                      indicatorBgPadding: 2.0,
                      images: [
                        ExactAssetImage("assets/images/banner1.jpg"),
                        ExactAssetImage("assets/images/banner2.jpg"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
                    child: Container(height:100,
                          color: Color(0xff005daa),
                          child:Padding(
                            padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children:[
                                    Text("500+",style:TextStyle(color:Colors.orange[300],fontWeight:FontWeight.w900,letterSpacing:1,fontSize:22)),
                                    Text("projects",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w500,letterSpacing:0,fontSize:18))
                                      ]
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children:[
                                    Text("|",style:TextStyle(color:Colors.white38,fontWeight:FontWeight.w600,fontSize:40)),
                                      ]
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children:[
                                    Text("56",style:TextStyle(color:Colors.orange[300],fontWeight:FontWeight.w900,letterSpacing:1,fontSize:22)),
                                    Text("Members",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w500,letterSpacing:0,fontSize:18))
                                      ]
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 320, 0, 0),
                    child: ListView(
                      children:[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                          child: Container(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                      child: 
                                      Container(
                                        height:80,
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Members()));
                                          },
                                          child:Container(child: Image(image: AssetImage("assets/images/team.png")))
                                          ),
                                      ),),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(height:80,child: GestureDetector(
                                        onTap: (){},
                                        child:Container(child: Image(image: AssetImage("assets/images/projectmain.png")))
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                                        child: Text("Member Details >",style:TextStyle(color:Colors.deepOrange,fontWeight:FontWeight.w500,letterSpacing:1,fontSize:13)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                        child: Text("Ongoing projects >",style:TextStyle(color:Colors.deepOrange,fontWeight:FontWeight.w500,letterSpacing:1,fontSize:13)),
                                      )  
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
                          child: Text("Recent Projects",style:TextStyle(color:Colors.grey[800],fontWeight:FontWeight.w700,letterSpacing:1,fontSize:18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 5.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children:[
                                ListTile(
                                  contentPadding: EdgeInsets.all(20),
                                  leading:CircleAvatar(
                                    radius:22,
                                    backgroundColor: Colors.lightBlue[50],
                                  child: ClipRRect(
                                    borderRadius:BorderRadius.circular(180),
                                    child: Image.asset("assets/images/project.png"),
                                  )),
                                  title: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 15, 110, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Project Name",style:TextStyle(color:Colors.grey[800],fontWeight:FontWeight.w700,letterSpacing:1,fontSize:15)),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(right:45),
                                              child: Text("Jul 9, 2020",style:TextStyle(color:Colors.grey[500],fontWeight:FontWeight.w500,letterSpacing:1,fontSize:12)),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right)
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(20),
                                  leading:CircleAvatar(
                                    radius:22,
                                    backgroundColor: Colors.lightBlue[50],
                                  child: ClipRRect(
                                    borderRadius:BorderRadius.circular(180),
                                    child: Image.asset("assets/images/project.png"),
                                  )),
                                  title:Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 15, 110, 0),
                                    child: Column(
                                      children: [
                                        Text("Project Name",style:TextStyle(color:Colors.grey[800],fontWeight:FontWeight.w700,letterSpacing:1,fontSize:15)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(right:45),
                                            child: Text("Jul 9, 2020",style:TextStyle(color:Colors.grey[500],fontWeight:FontWeight.w500,letterSpacing:1,fontSize:12)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right)
                                )
                              ]
                            ),
                          ),
                        )
                      ]
                    ),
                  ) 
                ]
              ),
            )
          );
        }
      }

