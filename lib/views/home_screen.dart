import 'package:calendar_app/viewmodels/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../viewmodels/product_item.dart';
import '../viewmodels/calendar.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Food'),
      ),
      body: Column(
        children: <Widget>[
          Calendar(products: _products),
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(_products[index].name),
                  onDismissed: (direction) {
                    _deleteProduct(index);
                  },
                  child: ProductListScreen(products: []),
                );
              },
            ),
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
              _addProduct(value);
            }
          });
        },
        tooltip: 'Добавить продукт',
        child: Icon(Icons.add),
      ),
    );
  }
}
