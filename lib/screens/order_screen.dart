import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/order.dart';
import 'package:provider/provider.dart';
import '../screens/order_row.dart';

class OrderScreen extends StatelessWidget {
  static var routeName = "/order";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Order>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ct, index) => OrderRow(ot: orders[index],),
        itemCount: orders.length,
      ),
    );
  }
}
