import 'package:flutter/material.dart';
import 'package:flutter_application_56/routes/app_router.gr.dart';
import 'package:flutter_application_56/screens/character_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
//AppRouter appRouter= AppRouter();
  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
     designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        //  routeInformationParser: _appRouter.defaultRouteParser(),
        // routerDelegate:_appRouter.delegate(),
       
        home: Character())

      );
    
  }}