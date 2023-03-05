import 'package:flutter/material.dart';
import 'package:meals/page/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Color titleBackground = Colors.amberAccent;
    return Drawer(
      child: Container(
        color: titleBackground,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Title(titleBackground: titleBackground),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    children: [
                      DrawerItem(
                        icon: Icons.fastfood,
                        text: 'Meals',
                        tapHandler: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                      ),
                      DrawerItem(
                        icon: Icons.settings,
                        text: 'Filter',
                        tapHandler: () {
                          Navigator.of(context)
                              .pushReplacementNamed(FiltersPage.route);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.tapHandler});

  final IconData icon;
  final String text;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: tapHandler,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListTile(
            leading: Icon(
              icon,
              size: 34,
            ),
            title: Text(
              text,
              style: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.titleBackground,
  });

  final Color titleBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: titleBackground,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Text(
          'Cooking Up!',
          style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
