import 'package:calendar_app/viewmodels/product_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products;

  ProductListScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    final myProducts = Provider.of<ProductItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Список продуктов'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(products[index].name[0]),
            ),
            title: Text(products[index].name),
            subtitle: Text(
              'Срок годности до ${DateFormat('dd.MM.yyyy').format(products[index].expirationDate)}'
              '${products[index].expirationDate.difference(DateTime.now()).inDays <= 3 ? ' (осталось меньше 3 дней!)' : ''}',
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
