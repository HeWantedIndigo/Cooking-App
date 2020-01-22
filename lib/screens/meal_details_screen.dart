import 'package:flutter/material.dart';
import '../data/meals_data.dart';

class MealDetailsScreen extends StatelessWidget {

  static const routeName = '/meal_details';
  final Function _toggleFavorites;
  final Function _isMealFavorite;

  MealDetailsScreen(this._toggleFavorites, this._isMealFavorite);

  @override
  Widget build(BuildContext context) {
    
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: <Widget>[
          IconButton(
            icon: _isMealFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
            onPressed: () => _toggleFavorites(mealId),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: Theme.of(context).textTheme.subtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          (index+1).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),                    
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.left,
                    ),
                    )
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}