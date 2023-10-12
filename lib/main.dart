

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:gsm/route_helper.dart';

import 'pages/auth/sign_in_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      // home: SplashScreen(), // Use the SplashScreen widget here
      home: SignInPage(),
    // initialRoute: RouteHelper.getSplashPage(),
    // getPages: RouteHelper.routes,
    
    );
  }
}









