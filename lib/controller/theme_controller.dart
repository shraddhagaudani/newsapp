import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/models/theme_model.dart';

import '../views/screens/utills.dart';

class ThemeController extends GetxController {
  ThemeModel themeModel = ThemeModel(isdark: box.read('isdarkmode') ?? false);

  changeTheme({required bool val}) {
    themeModel.isdark = val;
    box.write('isdarkmode', themeModel.isdark);
    (themeModel.isdark)
        ? Get.changeTheme(
            ThemeData.dark(useMaterial3: true),
          )
        : Get.changeTheme(
            ThemeData.light(useMaterial3: true),
          );
    update();
  }
}
