//import 'dart:js';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:summary/screens/home.dart';
import 'package:summary/screens/login.dart';
import 'package:summary/screens/reg.dart';
import 'package:summary/screens/article.dart';
import 'package:summary/screens/inputpage.dart';
//import 'Myimage_cam.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();

  runApp(
    MaterialApp(
      initialRoute: "inputpage",
      routes: {
        // "liquid_swipe":  (context) => MyliquidSwipe(),
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "article":(context)=> MyArticle(),
        "inputpage": (context) => Inputpage(),

        // "MyImage_cam":(context) => MyImage(),
      },
    ),
  );
}
