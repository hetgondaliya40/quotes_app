import 'package:flutter/cupertino.dart';

import '../view/screens/detalispage/details.dart';
import '../view/screens/homepage/home.dart';

class Routes {
  static String homepage = "/";
  static String detailspage = "details_page";

  static Map<String, WidgetBuilder> myRoutes = {
    homepage: (context) => const HomePage(),
    detailspage: (context) => const DetailsPage(),
  };
}
