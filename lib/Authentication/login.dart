import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/adminLogin.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Config/config.dart';
import '../Config/config.dart';
import '../DialogBox/errorDialog.dart';
import '../DialogBox/loadingDialog.dart';
import '../Store/storehome.dart';
import 'package:e_shop/Config/config.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}





class _LoginState extends State<Login>
{
  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();
  final TextEditingController _EmailTextEditingController = TextEditingController();
  final TextEditingController _PasswordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery
        .of(context)
        .size
        .width,
        _screenheight = MediaQuery
            .of(context)
            .size
            .height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Image.asset(
                "images/login.png",
                height: 240.0,
                width:240.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login to your Account",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _EmailTextEditingController,
                    data: Icons.email,
                    hintText: "Your Email-Id",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _PasswordTextEditingController,
                    data: Icons.person,
                    hintText: "Password",
                    isObsecure: true,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _EmailTextEditingController.text.isNotEmpty
                && _PasswordTextEditingController.text.isNotEmpty
                    ? LoginUser()
                    :showDialog(
                       context: context,
                        builder:(c)
                          {
                            return ErrorAlertDialog(message: "Please write Email and password",);
                          }
                );
              },
              color: Colors.blue,
              child: Text(
                "Login", style: TextStyle(color: Colors.white),),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 4.0,
              width: _screenwidth * 0.8,
              color: Colors.blue,
            ),
            SizedBox(
              height: 15.0,
            ),
            // FlatButton.icon(
            //     onPressed:()=> Navigator.push(context,
            //         MaterialPageRoute(
            //             builder: (context)=>
            //         )
            //    ),

            //)
          ],
        ),
      ),
    );
  }
  FirebaseAuth _auth=FirebaseAuth.instance;
  void LoginUser() async
  {
    showDialog(
        context: context,
          builder:(c)
        {
          return LoadingAlertDialog(message: "Authenticating, Please wait.....",);
        }
      );
    FirebaseUser firebaseUser;
    await _auth.signInWithEmailAndPassword(
      email: _EmailTextEditingController.text.trim(),
      password: _PasswordTextEditingController.text.trim(),
    ).then((authUser){
      firebaseUser=authUser.user;
  }
  ).catchError((error){
      Navigator.pop(context);
      showDialog(context: context,
          builder:(c)
      {
        return ErrorAlertDialog(message: error.message.toString());
      }
      );
    }
    );
    if(firebaseUser!=null)
      {
        readData(firebaseUser).then((s){
          Navigator.pop(context);
          Route route=MaterialPageRoute(builder: (c)=>StoreHome());
          Navigator.pushReplacement(context, route);
        }
        );
      }
  }
  Future readData(FirebaseUser fuser) async
  {
    Firestore.instance.collection("users").document(fuser.uid).get().then((dataSnapshot) async {
      await EcommerceApp.sharedPreferences.setString("uid", dataSnapshot.data[EcommerceApp.userUID]);
      await EcommerceApp.sharedPreferences.setString(EcommerceApp.userEmail, dataSnapshot.data[EcommerceApp.userEmail]);
      await EcommerceApp.sharedPreferences.setString(EcommerceApp.userName, dataSnapshot.data[EcommerceApp.userName]);
      await EcommerceApp.sharedPreferences.setString(EcommerceApp.userAvatarUrl, dataSnapshot.data[EcommerceApp.userAvatarUrl]);

    });
  }
}
