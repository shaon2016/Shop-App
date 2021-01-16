import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static final routeName = "/edit_product";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _imageUrlController = TextEditingController();

  final _titleFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();

  var _product = Product(
    id: null,
    title: null,
    description: null,
    price: null,
    imageUrl: null,
  );

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlFocusNode.dispose();

    _imageUrlController.dispose();

    _imageUrlFocusNode.removeListener(_updateImageUrl);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveFormData();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Title"),
                  validator: (value) {
                    if (value.isEmpty) return "Enter product title";
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _product = Product(
                      id: _product.id,
                      title: value,
                      description: _product.description,
                      price: _product.price,
                      imageUrl: _product.imageUrl,
                    );
                  },
                  focusNode: _titleFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Price"),
                  validator: (value) {
                    if (value.isEmpty) return "Enter product price";
                    if (double.parse(value) == 0 ) return "Please enter a price greater than zero.";
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: _product.description,
                      price: double.parse(value),
                      imageUrl: _product.imageUrl,
                    );
                  },
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Description"),
                  maxLines: 3,
                  validator: (value) {
                    if (value.isEmpty) return "Enter product description";
                    return null;
                  },
                  onSaved: (value) {
                    _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: value,
                      price: _product.price,
                      imageUrl: _product.imageUrl,
                    );
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        right: 8,
                      ),
                      width: 100,
                      height: 100,
                      child: _imageUrlController.text.isEmpty
                          ? Center(
                              child: FittedBox(
                                child: Text(
                                  "Enter Image Url",
                                ),
                              ),
                            )
                          : Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) return "Enter product image url";
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        decoration:
                            const InputDecoration(labelText: "Image Url"),
                        onSaved: (value) {
                          _product = Product(
                            id: _product.id,
                            title: _product.title,
                            description: _product.description,
                            price: _product.price,
                            imageUrl: value,
                          );
                        },
                        onFieldSubmitted: (_) {
                          _saveFormData();
                        },
                        focusNode: _imageUrlFocusNode,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveFormData() {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) setState(() {});
  }
}
