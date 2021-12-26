import 'package:flutter/material.dart';
import 'package:meals_app/Providers/Cart.dart';
import 'package:meals_app/Providers/Products_provider.dart';
import 'package:meals_app/Screens/cart_Screens.dart';
import 'package:meals_app/Widgets/Product_Grid.dart';
import 'package:meals_app/Widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../Widgets/ProductItem.dart';
import '../badge.dart';
enum FilterOpjects {
  Favorits,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showOnlyFavorit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Shop"),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOpjects selectedValue) {
                setState(() {
                  if (selectedValue == FilterOpjects.Favorits) {
                    _showOnlyFavorit = true;
                  } else {
                    _showOnlyFavorit = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("only Favourit"),
                  value: FilterOpjects.Favorits,
                ),
                PopupMenuItem(
                  child: Text("Show All"),
                  value: FilterOpjects.All,
                )
              ],
            ),
            Consumer<Cart>(
              builder: (_, cartdata, ch) => Badge(
                child: ch,
                value: cartdata.itemCount.toString(),
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routName);
                },
                icon: Icon(Icons.shopping_cart),
              ),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(_showOnlyFavorit));
  }
}
