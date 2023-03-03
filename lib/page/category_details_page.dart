import 'package:flutter/material.dart';
import '../dummy_data.dart';

import '../widget/meal_item.dart';

class CategoryDetailsPage extends StatelessWidget {
  static const route = '/category_details';

  const CategoryDetailsPage({super.key});

  /*
  const CategoryDetailsPage(
      {super.key, required this.categoryID, required this.categoryTitle});

  final String categoryID;
  final String categoryTitle;
*/
  @override
  Widget build(BuildContext context) {
    final Map routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final String categoryTitle = routeArgs['title'];
    final String categoryId = routeArgs['id'];
    final List categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => MealItem(meal: categoryMeals[index]),
          itemCount: categoryMeals.length,
        ));
  }
}
