import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

// class ProductItem extends StatelessWidget {
//   final Product product;

//   ProductItem({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         child: Text(product.name[0]),
//       ),
//       title: Text(product.name),
//       subtitle: Text(
//         'Срок годности до ${DateFormat('dd.MM.yyyy').format(product.expirationDate)}',
//       ),
//       trailing: Text(
//         'Добавлено ${DateFormat('dd.MM.yyyy').format(product.addedDate)}',
//       ),
//       onTap: () {},
//     );
//   }
// }

class ProductItem with ChangeNotifier {
  Product? _product;
  Product? get product => _product;
  List products = [];

  Future saveProduct(Product product) async {
    final object = await SharedPreferences.getInstance();
    await object.setString('product', product.name);
    await object.setString(
        'dataTime', product.expirationDate.toIso8601String());
    _product = product;
    products.add(product);
    notifyListeners();
  }

  Future<void> loadProduct() async {
    final object = await SharedPreferences.getInstance();
    final name = object.getString('product');
    final expirationDateString = object.getString('dataTime');
    if (name != null && expirationDateString != null) {
      _product = Product(
          name: name, expirationDate: DateTime.parse(expirationDateString));
      notifyListeners();
    }
  }

  Future<void> deleteProduct() async {
    final object = await SharedPreferences.getInstance();
    await object.remove('product');
    await object.remove('dataTime');
    _product = null;
    products.remove(_product);
    notifyListeners();
  }

  Future editProduct(Product product) async {
    final object = await SharedPreferences.getInstance();
    await object.setString('product', product.name);
    await object.setString(
        'dataTime', product.expirationDate.toIso8601String());
    _product = product;
    products.remove(_product);
    products.add(product);
    notifyListeners();
  }
}
