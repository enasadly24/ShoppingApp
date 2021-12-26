import 'dart:math';

import 'package:flutter/material.dart';
import '../Providers/Orders.dart' as ord;
import 'package:intl/intl.dart';

class Order_Item extends StatefulWidget {
  final ord.OrderItem order;

  Order_Item({this.order});

  @override
  State<Order_Item> createState() => _Order_ItemState();
}

class _Order_ItemState extends State<Order_Item> {
  var _expanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount}"),
            subtitle:
                Text(DateFormat('dd MM YYYY hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded?Icons.expand_less:
              Icons.expand_more),
              onPressed: (){
              setState(() {
                _expanded=!_expanded;
              });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        prod.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${prod.quantity}x \$${prod.price}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
