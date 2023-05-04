import 'package:flutter/material.dart';

class Product {
  final String name;
  final DateTime expirationDate;
  final DateTime addedDate;

  Product({
    required this.name,
    required this.expirationDate,
    DateTime? addedDate,
  }) : addedDate = addedDate ?? DateTime.now();
}
