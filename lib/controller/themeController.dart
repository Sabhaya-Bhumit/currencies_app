import 'package:flutter/material.dart';
import 'package:get/get.dart';

class themeController extends GetxController {
  bool dark = false;

  themeChange(bool val) {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    dark = val;
    // print(dark);
    update();
  }
}
