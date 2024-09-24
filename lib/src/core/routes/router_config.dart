import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/currency_converter/ui/currency_converter_page.dart';
import '../../modules/home/ui/home_page.dart';
import 'routes.dart';

final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: Routes.currency,
      builder: (BuildContext context, GoRouterState state) {
        return const CurrencyConverterPage();
      },
    ),
  ],
);
