import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_details_screen.dart';
import '../models/Meal.dart';

class MealItem extends StatelessWidget {

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Function removeItem;

  MealItem({
    @required this.id, 
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.removeItem,
  });

  void viewMealDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: id).then((result) {
      if (result!=null) {
        removeItem(result);
      }
    });
  }

  String get complexityText {
    if (complexity == Complexity.Simple)
      return "Simple";
    else if (complexity == Complexity.Challenging)
      return "Challenging";
    else
      return "Hard";
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable)
      return "Affordable";
    else if (affordability == Affordability.Pricey)
      return "Pricey";
    else
      return "Luxurious";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewMealDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover)
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(height: 5),
                      Text(" "+duration.toString()+" min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(height: 5),
                      Text(" "+complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 5),
                      Text(" "+affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}