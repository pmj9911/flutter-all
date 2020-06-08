import 'dart:math';

import 'package:flutter/widgets.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void removeItem(String prodId) {
    _items.remove(prodId);
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existing) => CartItem(
                id: existing.id,
                name: existing.name,
                quantity: existing.quantity + 1,
                price: existing.price,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                name: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
