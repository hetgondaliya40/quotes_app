import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/my_app/myapp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(const Myapp());
}
