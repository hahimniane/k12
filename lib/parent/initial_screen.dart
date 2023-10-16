import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maarif_k12/parent/login_screen.dart';
import 'package:maarif_k12/utils/const.dart';
import 'package:maarif_k12/utils/navigation_helper.dart';

class AppInitialPage extends StatefulWidget {
  const AppInitialPage({Key? key}) : super(key: key);

  @override
  State<AppInitialPage> createState() => _AppInitialPageState();
}

class _AppInitialPageState extends State<AppInitialPage> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double availableHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: availableHeight * 0.10,
                    bottom: availableHeight * 0.08),
                // color: Colors.blue,
                height: availableHeight * 0.2304,
                width: screenWidth * 0.6187,
                child: const Image(
                  fit: BoxFit.contain,
                  image: AssetImage('images/logo.png'),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: availableHeight * 0.00001),
                height: availableHeight * 0.0764,
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.notoSans(
                      color: parentAppColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 24),
                ),
              ),
              Container(
                // color: Colors.green,
                height: availableHeight * 0.2529,
                width: screenWidth * 0.9187,
                // color: Colors.greenAccent,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('images/initialChildrenImage.png'),
                ),
              ),
              Container(
                // color: Colors.blue,
                height: availableHeight * 0.1133,
                width: screenWidth * 0.9173,
                child: Text(
                  'You can follow school announcements, lecture notes, attendance information, and class schedules with the application.',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: availableHeight * 0.03),
                height: availableHeight * 0.0591,
                width: screenWidth * 0.3947,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () async {
                    NavigationHelper.pushWithAnimation(context, LoginPage());
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Logo
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     color: Colors.white70,
              //     child: const Center(
              //       child: Padding(
              //         padding: EdgeInsets.all(0.0),
              //         child: Image(
              //           image: AssetImage('images/logo.png'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // // Welcome text
              // Expanded(
              //   flex: 0,
              //   child: Text(
              //     'Welcome!',
              //     style: TextStyle(
              //       backgroundColor: Colors.white70,
              //       fontSize: 25,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //   ),
              // ),
              // // Photo holder
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     child: const Center(
              //         child: Image(
              //       image: AssetImage('images/image2.png'),
              //     )),
              //   ),
              // ),
              // // App description
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     'You can track your children\'s development on a daily, weekly, monthly, and yearly basis with Maarif e-preschool.',
              //     style: TextStyle(
              //       fontSize: 15,
              //       color: Theme.of(context).primaryColor,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // // Continue button
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   // color: Colors.blue,
              //   height: 80,
              //   padding: EdgeInsets.symmetric(horizontal: 110, vertical: 16),
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Theme.of(context).primaryColor,
              //     ),
              //     onPressed: () async {
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) => LoginPage()));
              //     },
              //     child: const Text(
              //       'Continue',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
