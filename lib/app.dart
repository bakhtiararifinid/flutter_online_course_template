import 'package:flutter/material.dart';
import 'package:flutter_online_course_template/pages/checkout_success_page.dart';
import 'package:flutter_online_course_template/pages/course_page.dart';
import 'package:flutter_online_course_template/pages/home_page.dart';
import 'package:flutter_online_course_template/pages/pick_favorite_page.dart';
import 'package:flutter_online_course_template/pages/register_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Course Template',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: RegisterPage.routeName,
      routes: {
        RegisterPage.routeName: (_) => const RegisterPage(),
        PickFavoritePage.routeName: (_) => const PickFavoritePage(),
        HomePage.routeName: (_) => const HomePage(),
        CoursePage.routeName: (_) => const CoursePage(),
        CheckoutSuccessPage.routeName: (_) => const CheckoutSuccessPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
