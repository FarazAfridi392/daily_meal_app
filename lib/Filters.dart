import 'package:flutter/material.dart';

import './Main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/Filters';

   Map<String, bool> currentFilters;

  Function saveFilters;
 
  Filters(this.currentFilters,this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  bool isLactoseFree = false;
  @override
  initState(){

    isGlutenFree = widget.currentFilters['gluten'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegetarian'];


    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String discription, bool value, Function function) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(
        discription,
      ),
      onChanged: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Main_drawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter),
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten Free',
                  'Only Include gluten-free meals',
                  isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only Include vegan meals',
                  isVegan,
                  (newValue) {
                    setState(
                      () {
                        isVegan = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegeterian',
                  'Only Include Vegeterian meals',
                  isVegetarian,
                  (newValue) {
                    setState(
                      () {
                        isVegetarian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Only Include lactose-free meals',
                  isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        isLactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
