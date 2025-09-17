import 'package:flutter/material.dart';

import 'add_new_product.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    ProductMenu option = ProductMenu.update;
    ProductMenu option2 = ProductMenu.delete;
    return Scaffold(
      appBar: AppBar(title: Text("product list")),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text("product name"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("code:0112330315"),
                Row(
                  spacing: 10,
                  children: [Text("price:200"), Text("quantity:5")],
                ),
              ],
            ),
            trailing: PopupMenuButton<ProductMenu>(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: ProductMenu.update,
                    child: Text("update"),
                  ),
                  PopupMenuItem(
                    value: ProductMenu.delete,
                    child: Text("delete"),
                  ),
                ];
              },
              onSelected: (ProductMenu SelectOption) {
                if (SelectOption == ProductMenu.update) {
                } else if (SelectOption == ProductMenu.delete) {
                  print("delete");
                }
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(indent: 70);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

enum ProductMenu { update, delete }
