import 'package:flutter/material.dart';

import '../MenuPage.dart';
import '../new_menu_page.dart';
import '../utils/build_appbar.dart';
import '../utils/const.dart';

class profileSelectionStudentCard extends StatelessWidget {
  final String studentName;
  final String imageUrl;
  final String studentNumber;
  const profileSelectionStudentCard({
    super.key,
    required this.studentName,
    required this.imageUrl,
    required this.studentNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 55.0,
                backgroundImage: AssetImage(imageUrl),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$studentName\n   (Student)',
                  style: TextStyle(
                      color: parentAppColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: parentAppColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewMenuPage()),
                    );
                  },
                  child: const Text(
                    'Select Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
