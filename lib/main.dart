import 'package:calendar_app/provider/product_provider.dart';
import 'package:calendar_app/views/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductItem(),
      child: MaterialApp(
        title: 'My Food',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: FirstScreen(),
      ),
    );
  }
}
