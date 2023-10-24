import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maarif_k12/new_menu_page.dart';
import 'package:maarif_k12/utils/appbar.dart';
import 'package:maarif_k12/utils/const.dart';

import '../../utils/bottom_navbar.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double availableHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 14),
              height: availableHeight * 0.11,
              width: screenWidth * 0.896,
              child: ListTile(
                leading: const Image(
                  height: 25,
                  width: 25,
                  image: AssetImage('images/payement.png'),
                ),
                trailing: Text(
                  'Paid',
                  style: GoogleFonts.notoSans(
                      color: parentAppColor, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: buildAppBar(
        title: announcementString,
        context: context,
        isFromSearch: false,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewMenuPage()));
          }
        },
      ),
    );
  }
}
