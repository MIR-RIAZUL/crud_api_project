import 'package:crud_api_project/home_scren.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "crud_app", home: homeScreen());
  }
}
