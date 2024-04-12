import 'package:flutter/material.dart';
import 'package:app/model/item.dart';

class ShoppingCart extends ChangeNotifier {
  List<Item> _products = [];

  List<Item> get cart => _products;

  void addItem(Item item) {
    _products.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _products.remove(item);
    notifyListeners();
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < _products.length;i++) {
      total = total + _products[i].price;
    }
    return total;
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }
}