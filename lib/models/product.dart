import 'package:flutter/foundation.dart';
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

// Map<String, dynamic> toMap() {
//   return {
//     'product': name,
//     'DataTime': expirationData,
//   };
// }

// factory Product.fromMap(Map<String, dynamic> map) {
//   return {
//     name: map['product'],
//     expirationDate: map['DataTime']
//   };
// }

// Product copyWith({
//   String? name,
//   DateTime? expirationDate,
// }) {
//   return Product(name: name ?? this.name, expirationDate: expirationDate ?? this.expirationDate,);
// }