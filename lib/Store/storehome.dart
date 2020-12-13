import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Store/product_page.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:e_shop/Config/config.dart';
import '../Widgets/loadingWidget.dart';
import '../Widgets/myDrawer.dart';
import '../Widgets/searchBox.dart';
import '../Models/item.dart';
import 'SortByPrice.dart';
import 'SortByPrice.dart';
import 'SortByRating.dart';



double width;

class StoreHome extends StatefulWidget {
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: DefaultTabController(
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
                  child: Text(
                    "Sort By price",
                    style: TextStyle(fontSize: 20.0,color: Colors.black,fontFamily: "Signatra"),
                  ),
                ),
                Tab(
                    child: Text(
                      "Sort By Rating",
                      style: TextStyle(fontSize: 20.0,color: Colors.black,fontFamily: "Signatra"),
                    )
                ),
              ],
              indicatorColor: Colors.black,
              indicatorWeight: 5.0,
            ),
          ),
           drawer: MyDrawer(),
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
                      sortByPrice(),
                      sortByRating(),
                    ]
                )
            )
        ),
    )
    );
  }
}



Widget sourceInfo(ItemModel model, BuildContext context,
    {Color background, removeCartFunction}) {
  return InkWell();
}



Widget card({Color primaryColor = Colors.redAccent, String imgPath}) {
  return Container();
}



void checkItemInCart(String productID, BuildContext context)
{
}
