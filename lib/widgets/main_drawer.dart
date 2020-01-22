import 'package:flutter/material.dart';
import 'package:food_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTitle(String title, Icon icon, BuildContext context, Function tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
        fontFamily: "RobotoCondensed",
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTitle(
            "Meals",
            Icon(Icons.restaurant),
            context,
            () {
              Navigator.of(context).pushReplacementNamed("/");
            }
          ),
          buildListTitle(
            "Filters",
            Icon(Icons.filter_b_and_w),
            context,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}