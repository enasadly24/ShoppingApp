import 'package:flutter/material.dart';
import 'package:meals_app/Providers/Products_provider.dart';
import 'package:meals_app/Widgets/ProductItem.dart';
import 'package:meals_app/models/products.dart';
import 'package:provider/provider.dart';
class ProductsGrid extends StatelessWidget {
  final bool showfavs;
 // final List<Product> loafefProducts;
  ProductsGrid(this.showfavs);
  @override
  Widget build(BuildContext context) {
   final ProductData= Provider.of<Products>(context);
   final products= showfavs?ProductData.favoritItems:ProductData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: products.length,
      // ctx=~ context
      itemBuilder:(ctx,i)=> ChangeNotifierProvider(
        create: (c)=>products[i],
        child: ProductItem(
       /*   loafefProducts[i].id,
          loafefProducts[i].title,
          loafefProducts[i].imageUrl,*/

        ),
      ),
      // number of columns
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //columns
          childAspectRatio: 3/2,
          crossAxisSpacing: 10, //space between coloumn,
          mainAxisSpacing: 10
      ),
    );
  }
}
