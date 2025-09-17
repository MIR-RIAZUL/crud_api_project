import 'package:crud_api_project/screen/update_product.dart';
import 'package:crud_api_project/widgets/product_Item.dart';
import 'package:flutter/material.dart';

import '../widgets/product_Item.dart';
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
          return product_Item();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(indent: 70);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addNewProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
