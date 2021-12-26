import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourit; // track if user has this favourit or not
  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavourit=false});

  void toggleFavoritStatus(){
    isFavourit=!isFavourit;
    notifyListeners(); //like setstate in provider packages
  }
}
