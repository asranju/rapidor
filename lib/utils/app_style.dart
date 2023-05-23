import 'package:flutter/material.dart';
import 'package:rapidor/utils/app_color.dart';
class AppStyle{


  static TextStyle dashboardHeadingText = TextStyle(fontWeight: FontWeight.w600, color: AppColor.whiteColor, fontSize: 16);

  static TextStyle headingStyle = TextStyle(fontWeight: FontWeight.bold, color: AppColor.whiteColor, fontSize: 14);
  static TextStyle contentStyle = TextStyle(fontWeight: FontWeight.normal, color: AppColor.primaryColor, fontSize: 14);
  static TextStyle heading = TextStyle(fontWeight: FontWeight.normal, color: AppColor.whiteColor, fontSize: 14);


  static datePickerTheme({required Widget? child, required BuildContext context}) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme(brightness: Brightness.light,
            primary: AppColor.primaryColor, onPrimary: Colors.white,
            secondary: AppColor.primaryColor, onSecondary: Colors.white,
            error: Colors.redAccent, onError: Colors.redAccent,
            background: AppColor.primaryColor, onBackground: AppColor.whiteColor,
            surface: AppColor.primaryColor, onSurface: AppColor.primaryColor),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColor.primaryColor, // button text color
          ),
        ),
      ), child: child!,
    );

  }

}