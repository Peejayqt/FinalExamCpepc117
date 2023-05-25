import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:go_router/go_router.dart';
import 'explore_screen.dart';
import 'grocery_screen.dart';
import 'recipes_screen.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.currentTab,
  });

  final int currentTab;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CJP',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          profileButton(widget.currentTab),
        ],
      ),
      body: IndexedStack(index: widget.currentTab, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: widget.currentTab,
        onTap: (index) {
          // TODO: Update user's selected tab
          // 1
          Provider.of<AppStateManager>(context, listen: false).goToTab(index);
// 2
          context.goNamed(
            'home',
            params: {
              'tab': '$index',
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Add to cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Check out Order',
          ),
        ],
      ),
    );
  }

  Widget profileButton(int currentTab) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/fooderlich_assets/logo.png',
          ),
        ),
        onTap: () {
          // TODO: Navigate to profile screen
          context.goNamed(
            'profile',
            params: {
              'tab': '$currentTab',
            },
          );
        },
      ),
    );
  }
}
