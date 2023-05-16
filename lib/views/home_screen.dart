import 'package:calendar_app/viewmodels/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../provider/product_provider.dart';
import '../viewmodels/calendar.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatelessWidget {
  List<Product> _products = [];

  @override
  Widget build(BuildContext context) {
    final myProducts = Provider.of<ProductItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Food'),
      ),
      body: Column(
        children: <Widget>[
          Calendar(products: _products),
          // ignore: prefer_const_constructors
          Expanded(
            child: Text(""),
            // ListView.builder(
            //   itemCount: _products.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Dismissible(
            //       key: Key(_products[index].name),
            //       onDismissed: (direction) {
            //         //! добавить удаление продукта
            //       },
            //       child: Row(
            //         children: [Text(ProductItem().loadProduct().toString())],
            //       ),
            //     );
            //   },
            // ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          ).then((value) {
            if (value != null) {
              //! Добавить сохранение продукта
            }
          });
        },
        tooltip: 'Добавить продукт',
        child: Icon(Icons.add),
      ),
    );
  }
}
