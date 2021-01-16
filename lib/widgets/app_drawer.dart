import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/manage_product_screen.dart';
import 'package:flutter_complete_guide/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hey there"),
            automaticallyImplyLeading: false,
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            leading: Text("Shop"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          Divider(),
          ListTile(
            leading: Text("Orders"),
            onTap: () {
              Navigator.pushNamed(
                context,
                OrderScreen.routeName,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Text("Manage Product"),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                ManageProductScreen.routeName,
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
