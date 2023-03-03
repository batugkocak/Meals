import 'package:flutter/material.dart';
import 'package:meals/page/meal_details_page.dart';

import '../model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

/*
 affordable,
  pricey,
  luxurious,
*/
  String get priceText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
    }
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      case Complexity.simple:
        return 'Simple';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () {
          Navigator.of(context)
              .pushNamed(MealDetailsPage.route, arguments: meal.id);
        },
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  //forces its child a certain shape
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit
                        .cover, //will resize and crop the image to cover all area
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: 160,
                      color: Colors.black54,
                      child: Text(
                        meal.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text('${meal.duration.toString()} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.hardware_sharp),
                      const SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [const Icon(Icons.attach_money), Text(priceText)],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
