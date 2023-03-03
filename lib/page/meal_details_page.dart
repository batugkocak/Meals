import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  const MealDetailsPage({super.key});
  static const route = '/meal_details';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Meal Details"),
      ),
    );
  }
}
