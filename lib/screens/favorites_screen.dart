import 'package:flutter/material.dart';
import 'package:food_app/models/Meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("No Favorites!", style: Theme.of(context).textTheme.display3),
      );
    } else {
      return ListView.builder(itemBuilder: 
      (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          categories: favoriteMeals[index].categories,
          imageUrl: favoriteMeals[index].imageUrl,
          ingredients: favoriteMeals[index].ingredients,
          steps: favoriteMeals[index].steps,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
          isGlutenFree: favoriteMeals[index].isGlutenFree,
          isVegan: favoriteMeals[index].isVegan,
          isVegetarian: favoriteMeals[index].isVegetarian,
          isLactoseFree: favoriteMeals[index].isLactoseFree,
          removeItem: () {},
        );
      }, itemCount: favoriteMeals.length,
      );
    }
  }
}