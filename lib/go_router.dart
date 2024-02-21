import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/extra_data.dart';
import 'package:untitled/pages/first_page.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/second_page.dart';

part 'go_router.g.dart';


@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<FirstRoute>(
      path: 'first',
      routes: [
        TypedGoRoute<SecondRoute>(
          path: 'second',
        ),
      ],
    )
  ],
)


class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class FirstRoute extends GoRouteData {
  const FirstRoute(this.$extra);
  final ExtraData? $extra;
  @override
  Widget build(BuildContext context, GoRouterState state) => FirstPage(
        index: $extra,
      );
}

class SecondRoute extends GoRouteData {
  const SecondRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SecondPage();
}
