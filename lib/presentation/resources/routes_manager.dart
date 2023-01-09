import 'package:flutter/material.dart';
import 'package:xyz_foods_admin/presentation/AddFoodItem/AddFoodItem.dart';
import 'package:xyz_foods_admin/presentation/SelectFoodCategory/SelectFoodCategory.dart';
import 'package:xyz_foods_admin/presentation/resources/strings_manager.dart';

class Routes {
  static const String initialRoute = '/';
  static const String addFoodItemRoute = '/AddFoodItem';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SelectFoodCategory());
        break;

      case Routes.addFoodItemRoute:
        return MaterialPageRoute(
            builder: (_) => const AddFoodItem(), settings: routeSettings);
        break;

      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
