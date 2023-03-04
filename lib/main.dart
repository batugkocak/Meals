import 'package:flutter/material.dart';

import './page/bottom_tabs_page.dart';
import './page/category_details_page.dart';
import './page/categories_page.dart';
import './page/meal_details_page.dart';
import './page/tabs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final myTheme = ThemeData(
      primaryColor: Colors.pink,
      secondaryHeaderColor: Colors.amber,
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
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          cardColor: Colors.amber));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'MyChef',
      //home: const CategoriesPage(),
      initialRoute: '/', //default is '/'

      routes: {
        '/': (ctx) => const BottomTabsPage(),
        CategoryDetailsPage.route: (_) => const CategoryDetailsPage(),
        MealDetailsPage.route: (_) => const MealDetailsPage(),
      },
      onUnknownRoute: (_) => MaterialPageRoute(
          builder: (context) =>
              const CategoriesPage()), //page that will open if an error occurs when navigating the user
      /* onGenerateRoute: (settings) {
        print(settings);
        print(settings.arguments);

        if(settings.name == 'meal_details'){
        return MaterialPageRoute(
          builder: (context) => CategoriesPage(),
        );
        }

      },*/ //page that will open if an null namedRoute occurs
    );
  }
}
