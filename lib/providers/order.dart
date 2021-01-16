import 'package:flutter/foundation.dart';
import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> items;
  final DateTime postDate;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.items,
    @required this.postDate,
  });
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> ct) {
    double amt = 0;

    ct.forEach((element) {
      amt += element.price * element.quantity;
    });

    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: amt,
        items: ct,
        postDate: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
