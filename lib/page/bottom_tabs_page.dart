import 'package:flutter/material.dart';
import '../page/categories_page.dart';
import '../page/favorites_page.dart';

class BottomTabsPage extends StatefulWidget {
  const BottomTabsPage({super.key});

  @override
  State<BottomTabsPage> createState() => _BottomTabsPageState();
}

class _BottomTabsPageState extends State<BottomTabsPage> {
  List<Widget> _pages = const [
    CategoriesPage(),
    FavoritesPage(),
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
      body: _pages.elementAt(_selectedPageIndex),
      appBar: AppBar(
        title: const Text('MyChef'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber.shade100,
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
