import 'package:flutter/material.dart';
import 'package:first_flutter_app/app_colors.dart';
import 'package:first_flutter_app/empty_screen.dart';
import 'package:first_flutter_app/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.blue,
        primaryColorLight: AppColors.blueLight,
        primaryColorDark: AppColors.blueDark,
        fontFamily: 'Avenir',
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: AppColors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColors.blue,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: AppColors.blue,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: AppColors.gray2,
            fontSize: 18.0,
          ),
          headline3: TextStyle(
            color: AppColors.gray3,
            fontSize: 17.0,
          ),
          headline4: TextStyle(
            color: AppColors.blue,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        dividerColor: AppColors.gray2,
      ),
      home: const EmptyScreen(),
    );
  }
}
