import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:flutter_complete_guide/widgets/my_product_row.dart';
import 'package:provider/provider.dart';

class ManageProductScreen extends StatelessWidget {
  static final routeName = "/manage_product";

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MyProductRow(
          title: productProvider.items[index].title,
          imageUrl: productProvider.items[index].imageUrl,
        ),
        itemCount: productProvider.items.length,
      ),
    );
  }
}
