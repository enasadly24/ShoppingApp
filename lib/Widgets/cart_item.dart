import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_app/Providers/Cart.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String ProductId;
  final double price;
  final int quantity;
  final String title;

   CartItems(this.id,this.ProductId,this.price, this.quantity, this.title);
  @override
  Widget build(BuildContext context) {
    return Dismissible( // give animation of removing
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeItem(ProductId);

      },
      confirmDismiss: (direction){
        return showDialog(
            context: context,
            builder: (ctx)=>AlertDialog(
              title: Text("Are you sure?"),
              content: Text(
                'Do you want to remove the item from the cart?',
              ),
              actions: [
                FlatButton(onPressed:(){
                    Navigator.of(ctx).pop(false);
                }, child: Text("No")),
                FlatButton(
                    onPressed: (){
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text("Yes"))
              ],
            ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text("\$$price")),
            ),
            title: Text(title),
            subtitle: Text("Total:\$${(price * quantity)}"),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
