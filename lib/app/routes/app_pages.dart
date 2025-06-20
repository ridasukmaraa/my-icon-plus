import 'package:get/get.dart';
import 'package:my_icon_plus/app/modules/home/presentation/bindings/home_binding.dart';
import 'package:my_icon_plus/app/modules/home/presentation/views/home_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
