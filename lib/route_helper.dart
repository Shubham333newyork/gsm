import 'package:gsm/pages/dustbin/dustbin.dart';
import 'package:gsm/pages/home/homepage.dart';
import 'package:get/get.dart';
import 'package:gsm/pages/splash/splash.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String dustbinPage = '/dustbin-page';
  static const String MapPage = '/map-page';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getdustbinPage() => "$dustbinPage";
  static String getmapPage() => "$MapPage";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () =>  SplashScreen()),
    GetPage(name: initial, page: () => const HomePage()),
    // GetPage(name: dustbinPage, page: () => DustbinApp()),
    // GetPage(name: MapPage, page: () => MapPage())
  ];
}
