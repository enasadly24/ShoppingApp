import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meals_app/Providers/Cart.dart';
import 'package:meals_app/Screens/Products_details_screen.dart';
import 'package:meals_app/models/products.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  /*final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id,this.title,this.imageUrl); */// 3shan required msh b7ot kerly braket
  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    final cart= Provider.of<Cart>(context,listen: false);
    return ClipRRect( // btzbt shakl el view bta3 el grid
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
            },
            child: Image.network(
             product.imageUrl,
              fit:BoxFit.cover
            ),
          ),
        footer: GridTileBar(
          // bi y7ot kalam t7t el swar fi el grid
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder:(ctx,product,_)=> IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                  product.isFavourit?
              Icons.favorite:Icons.favorite_border),
              onPressed: (){
                product.toggleFavoritStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,

          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              cart.addItem(product.id,product.price, product.title);
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                  content:Text("add item to cart"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: (){
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
