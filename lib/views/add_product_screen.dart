import 'package:flutter/material.dart';

import '../models/product.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  DateTime _expirationDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _expirationDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _expirationDate) {
      setState(() {
        _expirationDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить продукт'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(
                  hintText: 'Введите название продукта',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название продукта';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Выберите дату окончания срока годности',
                    ),
                    controller: TextEditingController(
                      text:
                          '${_expirationDate.day}.${_expirationDate.month}.${_expirationDate.year}',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Пожалуйста, выберите дату окончания срока годности';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      Product(
                        name: _productNameController.text,
                        expirationDate: _expirationDate,
                      ),
                    );
                  }
                },
                child: Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
