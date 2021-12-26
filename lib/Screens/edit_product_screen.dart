import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/Widgets/app_drawer.dart';
import 'package:meals_app/models/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routename = '/editProduct';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocuseNode = FocusNode(); //assign to a text input widget
  final _descriptionFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final _imageFocusNode= FocusNode();
  final _form =GlobalKey<FormState>();
  var _editProduct= Product(
    id:null,
    title: "",
    price: 0,
    description: "",
    imageUrl: ""
  );
  @override
  void initState() {
    _imageFocusNode.addListener(_UpdateImageUrl);
    super.initState();
  }
  @override
  void dispose() {
    //to be sure to clearup memory to avoid memory leak
    _imageFocusNode.removeListener(_UpdateImageUrl);
    _priceFocuseNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }
  void _UpdateImageUrl(){
    if(!_imageFocusNode.hasFocus){
      setState(() {
           //use the latest state
      });
    }
  }
  void _saveForm(){
    _form.currentState.save();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [
          IconButton(onPressed: (){
            _saveForm();
          }, icon:Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(
                      _priceFocuseNode); // 3shan lama el user ud5l inputs and press next will go to next field auto
                },
                onSaved: (val){
                  _editProduct=Product(
                      title: val,
                    price: _editProduct.price,
                    description: _editProduct.description,
                    imageUrl: _editProduct.imageUrl,
                    id: null
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocuseNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(
                      _descriptionFocusNode); // 3shan lama el user ud5l inputs and press next will go to next field auto
                },
                onSaved: (val){
                  _editProduct=Product(
                      title: _editProduct.title,
                      price: double.parse(val),
                      description: _editProduct.description,
                      imageUrl: _editProduct.imageUrl,
                      id: null
                  );
                },

              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (val){
                  _editProduct=Product(
                      title: _editProduct.title,
                      price: _editProduct.price,
                      description: val,
                      imageUrl: _editProduct.imageUrl,
                      id: null
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageURLController.text.isEmpty
                        ? Text("enter a url")
                        : FittedBox(
                            child: Image.network(
                                _imageURLController.text,
                                 fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageURLController,
                      focusNode: _imageFocusNode,
                      onFieldSubmitted: (_){
                        _saveForm();
                      },
                      onSaved: (val){
                        _editProduct=Product(
                            title: _editProduct.title,
                            price: _editProduct.price,
                            description: _editProduct.description,
                            imageUrl: val,
                            id: null
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
