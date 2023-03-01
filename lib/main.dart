import 'package:flutter/material.dart';
import 'package:meals/page/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final myTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.pink,
    ).copyWith(secondary: Colors.amber),
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
      home: const CategoriesPage(),
    );
  }
}
