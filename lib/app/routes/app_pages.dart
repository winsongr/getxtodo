import 'package:get/get.dart';
import 'package:getxtodo/app/modules/home/views/all_todo.dart';

import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => AllTodo(),
      binding: HomeBinding(),
    ),
  ];
}
