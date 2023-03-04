import 'package:flutter/material.dart';
import '../page/categories_page.dart';
import '../page/favorites_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    //TabController right under the AppBar
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('MyChef'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              CategoriesPage(),
              FavoritesPage(),
            ],
          )),
    );
  }
}
