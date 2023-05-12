import 'package:calendar_app/models/product.dart';
import 'package:calendar_app/viewmodels/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:calendar_app/viewmodels/product_item.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myProducts = Provider.of<ProductItem>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              SizedBox(
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text("Вход"),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Настройки"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
