import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maarif_k12/parent/initial_screen.dart';
import 'package:maarif_k12/theme_service.dart';
import 'package:maarif_k12/utils/const.dart';

import 'package:provider/provider.dart';

import 'ParentTheme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
          child: MyApp()), // Wrap your app
    ),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // textTheme: GoogleFonts.notoSansAdlamTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: parentAppColor,
            // ···
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              )),
          //
          // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          //   selectedItemColor: parentAppColor,
          //   unselectedItemColor: parentAppColor,
          // ),
          useMaterial3: true,
          brightness: Brightness.light,
          // primarySwatch: ColorScheme.fromSeed(seedColor: seedColor),
          // primarySwatch: parentAppColor,
          primaryColor: parentAppColor, // Normal user color
          // accentColor: Color(0xFF38C0C6), // You can customize other properties as needed
          // fontFamily: 'Montserrat',

          //
        ),
        // theme: Provider.of<ThemeProvider>(context).activeThemeData,
        //userType==UserType.admin?AdminTheme.lightTheme():ParentTheme.lightTheme(),
        // theme: ThemeData(
        //   iconTheme: IconThemeData(
        //     color: Colors.white, // Set your desired icon color
        //   ),
        //   appBarTheme: AppBarTheme(
        //     iconTheme: IconThemeData(
        //       color: Colors
        //           .white, // Set your desired icon color for the back icon in AppBar
        //     ),
        //   ),
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: parentAppColor,
        //   ),
        //   useMaterial3: true,
        // ),
        home: const AppInitialPage());
  }
}
