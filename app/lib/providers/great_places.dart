import 'package:flutter/material.dart';
import '../models/places.dart';
import 'dart:io';

class GreatPlaces extends ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void add(String title, File image) {
    final item = Place(DateTime.now().toIso8601String(), title, image);
    _items.add(item);
    notifyListeners();
  }

  // void removeAll() {
  //   _items.clear();
  //   notifyListeners();
  // }
}
