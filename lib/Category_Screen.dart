import 'package:flutter/material.dart';
import 'package:daily_meal/dummy_data.dart';
import 'Category_item.dart';

class Category_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((catData) {
          return Category_Item(catData.id,catData.title, catData.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
