import 'package:flutter/material.dart';

// * For Routing Views

abstract class RoutePath {
  static const String shopping = 'shopping';
  // static const String product = 'product';
  // static const String cart = 'cart';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    return null;
    // switch (settings.name) {
    //   case RoutePath.shopping:
    //     page = const ShoppingView();
    //     break;
    //   case RoutePath.product:
    //     final product = settings.arguments as Product;
    //     page = ProductView(product: product);
    //     break;
    //   case RoutePath.cart:
    //     page = const CartView();
    // }
    // return MaterialPageRoute(
    // builder: (context) => page,
    // );
  }
}
