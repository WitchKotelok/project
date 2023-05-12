import 'package:calendar_app/viewmodels/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart';

import '../models/product.dart';
import 'product_list_screen.dart';

class Calendar extends StatelessWidget {
  final List<Product> products;

  Calendar({required this.products});

  @override
  Widget build(BuildContext context) {
    final myProducts = Provider.of<ProductItem>(context);

    Map<DateTime, List<Product>> _groupedProducts = {};

    products.forEach((product) {
      DateTime date = DateTime(product.expirationDate.year,
          product.expirationDate.month, product.expirationDate.day);
      if (_groupedProducts.containsKey(date)) {
        _groupedProducts[date]!.add(product);
      } else {
        _groupedProducts[date] = [product];
      }
    });

    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.now(),
      lastDay: DateTime(2100),
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.none,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        // markersPositionBottom: 0,
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, products) {
          return _buildMarkers(date, _groupedProducts[date] ?? []);
        },
      ),
      selectedDayPredicate: (day) {
        DateTime date = DateTime(day.year, day.month, day.day);
        return _groupedProducts.containsKey(date);
      },
      rowHeight: 50,
      eventLoader: (date) {
        DateTime selectedDate = DateTime(date.year, date.month, date.day);
        return _groupedProducts[selectedDate] ?? [];
      },
      onDaySelected: (selectedDay, focusedDay) {
        DateTime date =
            DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
        List<Product> products = _groupedProducts[date] ?? [];
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductListScreen(products: products)),
        );
      },
    );
  }

  Widget _buildMarkers(DateTime date, List<Product> products) {
    List<Widget> markers = [];
    products.forEach((product) {
      int daysLeft = product.expirationDate.difference(date).inDays;
      if (daysLeft <= 3) {
        markers.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }
    });
    return Row(children: markers);
  }
}
