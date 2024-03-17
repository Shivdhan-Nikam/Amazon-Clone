import 'package:amazon_app/common/widgets/bottom_bar.dart';
import 'package:amazon_app/features/auth/screens/authscreen.dart';
import 'package:amazon_app/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.autheScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case BottomNavBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomNavBar(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Error Page Not Found"),
          ),
        ),
      );
  }
}
