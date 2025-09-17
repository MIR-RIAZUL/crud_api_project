import 'package:flutter/material.dart';

import '../screen/update_product.dart';

class product_Item extends StatelessWidget {
  const product_Item({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("product name"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("code:0112330315"),
          Row(spacing: 10, children: [Text("price:200"), Text("quantity:5")]),
        ],
      ),
      trailing: PopupMenuButton<ProductMenu>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: ProductMenu.update, child: Text("update")),
            PopupMenuItem(value: ProductMenu.delete, child: Text("delete")),
          ];
        },
        onSelected: (ProductMenu SelectOption) {
          if (SelectOption == ProductMenu.update) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => update_Product()),
            );
          } else if (SelectOption == ProductMenu.delete) {
            print("delete");
          }
        },
      ),
    );
  }
}

enum ProductMenu { update, delete }
