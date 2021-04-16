import 'package:daily_meal/Main_drawer.dart';

import './Category_Screen.dart';
import './Favorites_Screen.dart';
import 'package:flutter/material.dart';
import './Meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  Function toggleFavorites;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  @override
  initState() {
    pages = [
      {'page': Category_Screen(), 'title': 'Categories'},
      {'page': Favorites_Screen(widget.favoriteMeals,), 'title': 'Favorites'},
    ];
    super.initState();
  }

  int setIndex = 0;

  void selectPage(int index) {
    setState(() {
      setIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[setIndex]['title'],
        ),
      ),
      drawer: Main_drawer(),
      body: pages[setIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: setIndex,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text(
              'Favorites',
            ),
          ),
        ],
      ),
    );
  }
}
