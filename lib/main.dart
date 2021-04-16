import 'package:daily_meal/dummy_data.dart';
import './Cartegory_meal.dart';
import './TabsScreen.dart';
import './detail_sreen.dart';
import 'package:flutter/material.dart';
import './Filters.dart';
import './Meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favoriteMeals = [];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void toggleFavorites(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((meals) => meals.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((meals) => meals.id == mealId));
      });
    }
  }

  bool isFavorite(String mealId) {
    return favoriteMeals.any((meals) => meals.id == mealId);
  }

  void setFilters(Map<String, bool> filterDate) {
    setState(() {
      filters = filterDate;
      availableMeals = DUMMY_MEALS.where((meals) {
        if (filters['gluten'] && !meals.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meals.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meals.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meals.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      // home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteMeals),
        CategoryMeal.routeName: (context) => CategoryMeal(availableMeals),
        DetailScreen.routeName: (context) =>
            DetailScreen(toggleFavorites, isFavorite),
        Filters.routeName: (context) => Filters(filters, setFilters),
      },
    );
  }
}
