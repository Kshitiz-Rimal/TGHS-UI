import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Address/addAddress.dart';
import 'package:e_shop/Store/Search.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Orders/myOrders.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom:10.0),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  EcommerceApp.sharedPreferences.getString(EcommerceApp.userEmail),
                  style: TextStyle(color: Colors.black,fontSize:35.0,fontFamily: "Signatra"),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.0,),
          Container(
            padding: EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Colors.black,),
                  title: Text("Home",style: TextStyle(color: Colors.black),),
                  onTap: (){
                    Route route=MaterialPageRoute(builder: (c)=>StoreHome());
                    Navigator.pushReplacement(context, route);
                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 6.0,),ListTile(
                  leading: Icon(Icons.quick_contacts_dialer, color: Colors.black,),
                  title: Text("Add Phone Number",style: TextStyle(color: Colors.black),),
                  onTap: (){
                    Route route=MaterialPageRoute(builder: (c)=>AddAddress());
                    Navigator.pushReplacement(context, route);
                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 6.0,),ListTile(
                  leading: Icon(Icons.lock, color: Colors.black,),
                  title: Text("Logout",style: TextStyle(color: Colors.black),),
                  onTap: (){
                    EcommerceApp.auth.signOut().then((c){
                      Route route=MaterialPageRoute(builder: (c)=>AuthenticScreen());
                      Navigator.pushReplacement(context, route);
                    });
                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 6.0,),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
