import 'package:flutter/material.dart';
import 'package:futurejob/Pages/CategoriesPage.dart';
import 'package:futurejob/Pages/DetailsPage.dart';
import 'package:futurejob/Pages/HomePage.dart';

import 'package:futurejob/Pages/SignIn.dart';
import 'package:futurejob/Pages/SignUp.dart';
import 'package:futurejob/Pages/StartedPage.dart';
import 'package:futurejob/Pages/SplashPage.dart';
import 'package:futurejob/Providers/CategoryProvider.dart';
import 'package:futurejob/Providers/JobProvider.dart';
import 'package:provider/provider.dart';

import 'Providers/AuthProvider.dart';
import 'Providers/UserProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProdiver>(
          create: (context) => UserProdiver(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/homepage': (context) => HomePage(),
          '/started': (context) => StartedPage(),
          '/sign-in': (context) => SignIn(),
          '/sign-up': (context) => SignUp(),
          // '/categories': (context) => CategoriesPage(),
          '/details': (context) => DetailsPage(),
        },
      ),
    );
  }
}
