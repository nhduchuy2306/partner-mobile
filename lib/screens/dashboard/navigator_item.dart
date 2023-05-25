import 'package:flutter/cupertino.dart';
import 'package:grocery_app/screens/account/account_screen.dart';
import 'package:grocery_app/screens/cart/cart_screen.dart';
import 'package:grocery_app/screens/explore_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';

import '../notification_screen.dart';

class NavigatorItem {
  final String label;
  final IconData iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", CupertinoIcons.home, 0, HomeScreen()),
  NavigatorItem("Explore", CupertinoIcons.search, 1, ExploreScreen()),
  NavigatorItem("Cart", CupertinoIcons.shopping_cart, 2, CartScreen()),
  NavigatorItem("Notification", CupertinoIcons.bell, 3, NotificationScreen()),
  NavigatorItem("Account", CupertinoIcons.person, 4, AccountScreen()),
];
