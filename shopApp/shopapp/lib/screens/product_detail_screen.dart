import 'package:flutter/material.dart';
import 'package:shopapp/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
