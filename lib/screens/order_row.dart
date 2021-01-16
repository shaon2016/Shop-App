import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/order.dart';

class OrderRow extends StatefulWidget {
  final OrderItem ot;

  const OrderRow({@required this.ot});

  @override
  _OrderRowState createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  var isToExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  "${widget.ot.amount.toStringAsFixed(2)}",
                ),
              ),
            ),
          ),
          title: Text(widget.ot.postDate.toString()),
          trailing: IconButton(
            icon: isToExpand ? Icon(Icons.expand_less) : Icon(Icons.expand),
            onPressed: () {
              setState(() {
                isToExpand = !isToExpand;
              });
            },
          ),
        ),
        if (isToExpand)
          Container(
            padding: EdgeInsets.all(16),
            height: 100,
            child: ListView.builder(
              itemCount: widget.ot.items.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${widget.ot.items[index].title}"),
                    Text("${widget.ot.items[index].quantity}X"),
                  ],
                ),
              ),
            ),
          )
        else
          Container()
      ],
    );
  }
}
