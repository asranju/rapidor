
import 'package:flutter/material.dart';
import 'package:rapidor/app_ui/report_date_wise_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashUI createState()=> SplashUI();
}
class SplashUI extends State<SplashScreen>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) =>const ReportDateWiseScreen()),
        ModalRoute.withName('/desiredRoute'),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          'assets/images/rapidorlogo.png',fit: BoxFit.fill),
    );
  }

}