import 'package:flutter/material.dart';
import 'package:meals/page/category_details_page.dart';

//import '../page/category_details_page.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  void selectCategory(BuildContext context) {
    /*
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            CategoryDetailsPage(categoryID: id, categoryTitle: title),
      ),
    );
    */
    Navigator.of(context).pushNamed(CategoryDetailsPage.route,
        arguments: {'id': id, 'title': title});
  }

  final String title;
  final Color color;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
