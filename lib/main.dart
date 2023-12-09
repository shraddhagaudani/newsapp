import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsapp/controller/theme_controller.dart';
import 'package:newsapp/views/screens/home_page.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  ThemeController themeController = Get.put(ThemeController());
  runApp(
    GetMaterialApp(
      theme: (themeController.themeModel.isdark)
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(
              useMaterial3: true,
            ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => const HomePage())],
    ),
  );
}
