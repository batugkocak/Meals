import 'package:flutter/material.dart';

import '../page/categories_page.dart';
import '../page/favorites_page.dart';
import '../widget/main_drawer.dart';

class BottomTabsPage extends StatefulWidget {
  const BottomTabsPage({super.key});

  @override
  State<BottomTabsPage> createState() => _BottomTabsPageState();
}

class _BottomTabsPageState extends State<BottomTabsPage> {
  final List<Map<String, Object>> _pages = const [
    {'page': CategoriesPage(), 'title': 'Categories'},
    {'page': FavoritesPage(), 'title': 'Favorites'},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(size: 35),
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category)),
          BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite))
        ],
        onTap: _selectPage,
      ),
    );
  }
}
