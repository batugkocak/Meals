import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../model/meal.dart';

class MealDetailsPage extends StatelessWidget {
  const MealDetailsPage({super.key});

  static const route = '/meal_details';

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context)!.settings.arguments as String;

    Meal meal = DUMMY_MEALS.where((element) {
      return mealID == element.id;
    }).single;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              )),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            child: Text('#${(index + 1)}'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            child: Text(meal.steps[index]),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: meal.steps.length,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildContainer(Widget child) {
  return Container(
    height: 200,
    width: 300,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15)),
    child: child,
  );
}

Widget buildSectionTitle(BuildContext ctx, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: Theme.of(ctx).textTheme.titleLarge,
    ),
  );
}
