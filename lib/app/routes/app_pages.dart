import 'package:get/get.dart';

import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/user_add/bindings/user_add_binding.dart';
import '../modules/user_add/views/user_add_view.dart';
import '../modules/user_detail/bindings/user_detail_binding.dart';
import '../modules/user_detail/views/user_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.user;

  static final routes = [
    GetPage(
      name: _Paths.user,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.userDetail,
      page: () => const UserDetailView(),
      binding: UserDetailBinding(),
    ),
    GetPage(
      name: _Paths.userAdd,
      page: () => const UserAddView(),
      binding: UserAddBinding(),
    ),
  ];
}
