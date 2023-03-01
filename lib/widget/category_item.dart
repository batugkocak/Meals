import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        gradient: LinearGradient(colors: [
          color.withOpacity(0.8),
          color,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Text(title),
    );
  }
}
