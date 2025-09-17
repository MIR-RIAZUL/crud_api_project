import 'package:flutter/material.dart';

class update_Product extends StatefulWidget {
  const update_Product({super.key});

  @override
  State<update_Product> createState() => _update_ProductState();
}

class _update_ProductState extends State<update_Product> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("update product")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "product name",
                    labelText: "product name",
                  ),
                ),

                TextFormField(
                  controller: _codeController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "product code",
                    labelText: "product code",
                  ),
                ),

                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "quantity",
                    labelText: "quantity",
                  ),
                ),

                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "unit price",
                    labelText: "unit price",
                  ),
                ),

                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    hintText: "image url",
                    labelText: "image url",
                  ),
                ),
                SizedBox(height: 10),
                FilledButton(onPressed: () {}, child: Text("update product")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}
