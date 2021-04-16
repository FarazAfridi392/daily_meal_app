import 'package:daily_meal/Cartegory_meal.dart';
import 'package:flutter/material.dart';

class Category_Item extends StatelessWidget {
  String id;
  String title;
  Color color;

  Category_Item(this.id, this.title, this.color);

  void SelectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMeal.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
