import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseURL = 'flutter-varios-7fa5e-default-rtdb.firebaseio.com';

  final List<Product> products = [];
}
