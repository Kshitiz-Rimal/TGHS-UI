import 'package:flutter/material.dart';
import 'login.dart';
import 'login.dart';
import 'register.dart';
import 'package:e_shop/Config/config.dart';

import 'register.dart';


class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.blue,Colors.white],
                begin:const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp,
              )
            ),
          ),
          title: Text(
            "TGHS",
                style: TextStyle(fontSize: 55.0,color:Colors.black,fontFamily:"Signatra"),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock,color:Colors.black,),
                child: Text(
                    "Login",
                     style: TextStyle(fontSize: 20.0,color: Colors.black,fontFamily: "Signatra"),
                ),
              ),
              Tab(
                  icon: Icon(Icons.perm_contact_calendar,color:Colors.black,),
                child: Text(
                  "Registration",
                  style: TextStyle(fontSize: 20.0,color: Colors.black,fontFamily: "Signatra"),
              )
              ),
            ],
              indicatorColor: Colors.black,
              indicatorWeight: 5.0,
          ),
        ),
        body:Container(
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.white,Colors.white],
                begin:Alignment.topRight,
                end: Alignment.bottomLeft,
              )
          ),
          child:TabBarView(
            children:[
             Login(),
             Register(),
            ]
          )
        )
      )
    );
  }
}
