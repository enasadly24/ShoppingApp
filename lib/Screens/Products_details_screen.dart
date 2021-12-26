import 'package:flutter/material.dart';
import 'package:meals_app/Providers/Products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
/*  final String title;
  final double price;
  ProductDetailScreen(this.title,this.price);*/
static const routeName='/productt';
  @override
  Widget build(BuildContext context) {
   final ProductId=ModalRoute.of(context).settings.arguments as String;
   final ProductDetailsloaded= Provider.of<Products>(context,listen: false).findById(ProductId);   // 7atena el listen hena false msh 3auzean n3ml update lel data not rebuild
    
    return Scaffold(
      appBar: AppBar(
      title: Text(ProductDetailsloaded.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  ProductDetailsloaded.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text("\$${ProductDetailsloaded.price}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20
              ),
            ), SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                ProductDetailsloaded.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
