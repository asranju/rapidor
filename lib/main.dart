import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapidor/app_bloc/date_bloc.dart';
import 'package:rapidor/utils/app_theme.dart';

import 'app_ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<DateBloc>(create: (BuildContext context)=> DateBloc())

      ],child: MaterialApp(

      theme: AppTheme.appThemeConfig,
      debugShowCheckedModeBanner: false,
      title: "Rapidor",
      home:const SplashScreen(),
    ));
  }
}

