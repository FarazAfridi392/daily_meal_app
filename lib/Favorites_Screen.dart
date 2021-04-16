import 'package:flutter/material.dart';
import './Meal.dart';
import './Meal_item.dart';

class Favorites_Screen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  Favorites_Screen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty){
      return Center(child: Text('You have no favorites - yet, Start adding some!'),);
    }
    else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability
            );
          },
          itemCount: favoriteMeals.length,
        );
    }
    
  }
}