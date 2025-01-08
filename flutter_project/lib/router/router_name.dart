
import 'package:flutter_project/pages/view/home_view.dart';
import 'package:flutter_project/pages/view/login_view.dart';
import 'package:flutter_project/router/router_page.dart';
import 'package:get/get.dart';

class RoutersPages {
  static final routers = [
    GetPage(
      name: RouterNames.login,
      page: () =>  const LoginPage(),
    ),
    GetPage(
      name: RouterNames.home,
      page: () =>  const HomePage(),
    ),
  ];
}
