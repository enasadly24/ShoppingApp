import 'package:flutter/material.dart';
import 'package:meals_app/Providers/Orders.dart';
import 'package:meals_app/Widgets/OrderItems.dart';
import 'package:provider/provider.dart';

 class OrdersScreen extends StatelessWidget {
static const routeName='/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData= Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context,i)=>Order_Item(
          order: ordersData.orders[i]
        )
      ),
    );
  }
}
