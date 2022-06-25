import 'package:flutter/material.dart';

import 'Screens/SplashScreen.dart';
import 'Screens/OverViewScreen.dart';

void main() => runApp(
      MaterialApp(
        title: 'Telusur App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/detail_page': (context) => OverViewPage(),
        },
        // home: SplashScreen(),
      ),
    );
