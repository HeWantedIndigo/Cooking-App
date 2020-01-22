import 'package:flutter/material.dart';
import 'package:food_app/models/Meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String title;
  List<Meal> categoryMeals;
  Color color;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeData = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      title = routeData['title'];
      color = routeData['color'];
      final categoryId = routeData['id'];
      categoryMeals = widget._availableMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      }
      ).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
    }

    void _removeMeal(String mealId) {
      setState(() {
        categoryMeals.removeWhere((meal) => meal.id == mealId);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
          ),
        backgroundColor: color,
      ),
      body: ListView.builder(itemBuilder: 
      (ctx, index) {
        return MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          categories: categoryMeals[index].categories,
          imageUrl: categoryMeals[index].imageUrl,
          ingredients: categoryMeals[index].ingredients,
          steps: categoryMeals[index].steps,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
          isGlutenFree: categoryMeals[index].isGlutenFree,
          isVegan: categoryMeals[index].isVegan,
          isVegetarian: categoryMeals[index].isVegetarian,
          isLactoseFree: categoryMeals[index].isLactoseFree,
          removeItem: _removeMeal,
        );
      }, itemCount: categoryMeals.length,
      ),
    );
  }
}