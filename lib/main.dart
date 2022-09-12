import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/controllers/test_controllers.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/views/assessment_screen.dart';
import 'package:test_app/views/question_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TestController testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    );

    return MaterialApp(
      title: 'Flutter Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ThemeColors.appPrimaryColor,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
          headline3: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          headline4: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
          headline5: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
          headline6: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
          bodyText2: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
        ),
        scaffoldBackgroundColor: ThemeColors.appLightBgColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  const AssesmentScreen() 
    );
  }
}
