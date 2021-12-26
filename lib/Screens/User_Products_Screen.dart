import 'package:flutter/material.dart';
import 'package:meals_app/Providers/Products_provider.dart';
import 'package:meals_app/Screens/edit_product_screen.dart';
import 'package:meals_app/Widgets/User_Product_Item.dart';
import 'package:meals_app/Widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
 static const routeName='/user-products';
  @override
  Widget build(BuildContext context) {
    final ProductData= Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),// avoid rebuild
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routename);
        }, icon:const  Icon(Icons.add))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: ProductData.items.length,
            itemBuilder:(_,i)=>Column(
              children: [
                Divider(),
                UserProductItem(
                    ProductData.items[i].title,
                    ProductData.items[i].imageUrl
                ),
              ],
            )
        ),
      ),
    );
  }
}
