import 'package:flutter/material.dart';
import 'package:flutter_project/router/router_name.dart';
import 'package:flutter_project/router/router_page.dart';
import 'package:flutter_project/utils/constant_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString(ConstantUtils.sharedPrefsTokenKey) ?? '';
  runApp(ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return KeyboardDismissOnTap(
            child: GetMaterialApp(
          getPages: RoutersPages.routers,
          themeMode: ThemeMode.system,
          initialRoute: token != '' ? RouterNames.login : RouterNames.home,
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
        ));
      }));
}
