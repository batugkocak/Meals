import 'package:flutter/material.dart';
import 'package:meals/page/category_details_page.dart';

import 'package:meals/page/categories_page.dart';
import 'package:meals/page/meal_details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final myTheme = ThemeData(
    primaryColor: Colors.pink,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.pink,
    ).copyWith(primary: Colors.pink, secondary: Colors.amber),
    canvasColor: const Color.fromRGBO(255, 255, 220, 1),
    fontFamily: 'Raleway',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Color.fromRGBO(20, 51, 51, 1),
      ),
      bodyMedium: TextStyle(
        color: Color.fromRGBO(20, 51, 51, 1),
      ),
      titleLarge: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(20, 51, 51, 1),
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'MyChef',
      //home: const CategoriesPage(),
      initialRoute: '/', //default is '/'
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(
          builder: (context) =>
              const CategoriesPage()), //hata durumunda açılacak sayfa
      routes: {
        '/': (ctx) => const CategoriesPage(),
        CategoryDetailsPage.route: (ctx) => const CategoryDetailsPage(),
        MealDetailsPage.route: (context) => const MealDetailsPage(),
      },
    );
  }
}
