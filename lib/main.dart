import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_icon_plus/app/routes/app_pages.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
