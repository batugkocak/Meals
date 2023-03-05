import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  static const route = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: const SafeArea(
          child: Center(
        child: Text('FILTERS!'),
      )),
    );
  }
}
