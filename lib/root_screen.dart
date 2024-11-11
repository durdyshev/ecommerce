import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currenctScreen = 0;
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    controller = PageController(initialPage: currenctScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: currenctScreen,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (index) {
            setState(() {
              currenctScreen = index;
            });
            controller.jumpToPage(currenctScreen);
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.home),
                icon: Icon(IconlyBold.home),
                label: "Home"),
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.search),
                icon: Icon(IconlyBold.search),
                label: "Search"),
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.bag2),
                icon: Icon(IconlyBold.bag2),
                label: "Cart"),
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.profile),
                icon: Icon(IconlyBold.profile),
                label: "Profile"),
          ]),
    );
  }
}
