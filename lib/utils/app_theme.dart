import 'package:flutter/material.dart';
import 'package:rapidor/utils/app_style.dart';


import 'app_color.dart';

class AppTheme{

static final appThemeConfig= ThemeData(

  appBarTheme: AppBarTheme(
          centerTitle: true,
         backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
           shadowColor: AppColor.primaryColor.withOpacity(0.1),
        titleTextStyle: AppStyle.dashboardHeadingText,
     iconTheme: IconThemeData(
     color: AppColor.primaryColor,
   )
   ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColor.whiteColor,
      filled: true,
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal,),
      prefixIconColor: AppColor.primaryColor,
      suffixIconColor: AppColor.primaryColor,

      hintStyle:   const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, color: Colors.grey  ),

      contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 21.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide:  BorderSide(width: 1.0, color: AppColor.primaryColor, )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide:  BorderSide(width: 1.0, color: AppColor.primaryColor,)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0),
          borderSide:  BorderSide(width: 1.0, color: AppColor.primaryColor)),
    )
 );

   }