import 'package:flutter/material.dart';
import 'package:meals_app/HomePage.dart';
import 'package:meals_app/Providers/Cart.dart';
import 'package:meals_app/Providers/Orders.dart';
import 'package:meals_app/Providers/Products_provider.dart';
import 'package:meals_app/Screens/OrderScreen.dart';
import 'package:meals_app/Screens/Products_details_screen.dart';
import 'package:meals_app/Screens/Products_overview_screen.dart';
import 'package:meals_app/Screens/User_Products_Screen.dart';
import 'package:meals_app/Screens/cart_Screens.dart';
import 'package:meals_app/Screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(),
  );

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create:(_)=> Products()
    ),
           ChangeNotifierProvider(
            create:(_)=> Cart()
        ),
        ChangeNotifierProvider(create: (_)=>Orders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
        ),
        home:  ProductsOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName:(context)=>ProductDetailScreen(),
          CartScreen.routName:(ctx)=>CartScreen(),
          OrdersScreen.routeName:(ctx)=>OrdersScreen(),
          UserProductsScreen.routeName:(ctx)=>UserProductsScreen(),
          EditProductScreen.routename:(ctx)=>EditProductScreen()


        },
      ),
    );
  }
}


