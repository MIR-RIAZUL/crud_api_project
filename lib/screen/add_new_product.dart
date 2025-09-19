import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class addNewProduct extends StatefulWidget {
  const addNewProduct({super.key});

  @override
  State<addNewProduct> createState() => _addNewProductState();
}

class _addNewProductState extends State<addNewProduct> {
  bool AddProductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add new product")),
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
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _codeController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "product code",
                    labelText: "product code",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product code';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "quantity",
                    labelText: "quantity",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter quantity';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "unit price",
                    labelText: "unit price",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter unit price';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    hintText: "image url",
                    labelText: "image url",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter image url';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Visibility(
                  visible: AddProductInProgress == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: FilledButton(
                    onPressed: _onTapAddProduct,
                    child: Text("add new product"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapAddProduct() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    AddProductInProgress = true;
    setState(() {});

    //prepare url to request
    Uri uri = Uri.parse("http://35.73.30.144:2008/api/v1/CreateProduct");
    //prepare data
    Map<String, dynamic> requestBody = {
      "ProductName": _nameController.text,
      "ProductCode": int.parse(_codeController.text),
      "Img": _imageUrlController.text,
      "Qty": int.parse(_quantityController.text),
      "UnitPrice": int.parse(_priceController.text),
      "TotalPrice":
          (int.parse(_quantityController.text) *
          double.parse(_priceController.text)),
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      if (decodeJson['status'] == 'success') {
        _clearTextFields();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("product added successfully")));
      } else {
        String message = decodeJson['data'];
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    }

    AddProductInProgress = false;
    setState(() {});
  }

  @override
  dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _clearTextFields() {
    _nameController.clear();
    _codeController.clear();
    _quantityController.clear();
    _priceController.clear();
    _imageUrlController.clear();

    setState(() {});
  }
}
