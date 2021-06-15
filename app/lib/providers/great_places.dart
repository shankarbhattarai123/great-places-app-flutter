import 'package:flutter/material.dart';
import '../models/places.dart';

class GreatPlaces extends ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
  // void add(Place item) {
  //   _items.add(item);
  //   notifyListeners();
  // }

  // void removeAll() {
  //   _items.clear();
  //   notifyListeners();
  // }
}
