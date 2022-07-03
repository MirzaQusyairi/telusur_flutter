import 'package:flutter/material.dart';

import 'Screens/SplashScreen.dart';
import 'Screens/OverViewScreen.dart';
import 'Screens/SignInPage.dart';

void main() => runApp(
      MaterialApp(
        title: 'Telusur App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/detail_page': (context) => OverViewPage(),
          '/login': (context) => SignInPage(),
        },
        // home: SplashScreen(),
      ),
    );
