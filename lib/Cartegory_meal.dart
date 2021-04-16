import 'package:daily_meal/Meal_item.dart';
import 'package:flutter/material.dart';
import './Meal.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = '/Category_meal';

  List<Meal> availableMeals;

  CategoryMeal(this.availableMeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  String categoryTitle;
  List<Meal> displayedMeal;
  var isinitState = false;

  @override
  void didChangeDependencies() {
    if (!isinitState) {
      final routArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routArgs['id'];
      categoryTitle = routArgs['title'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      isinitState = true;
    }

    super.didChangeDependencies();
  }

  void remove_item(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
            
            );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
