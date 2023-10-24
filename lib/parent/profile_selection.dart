import 'package:flutter/material.dart';
import '../ReusableWidgets/student_card.dart';
import '../utils/appbar.dart';
import '../utils/build_appbar.dart';
import '../utils/const.dart';

class ParentProfileSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(
        title: profileSelectionString,
        context: context,
        isFromSearch: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            profileSelectionStudentCard(
              studentName: 'Yavuz Selim',
              imageUrl: 'images/img.png',
              studentNumber: '12345',
            ),
            profileSelectionStudentCard(
              studentName: 'Abdullah Niane',
              imageUrl: 'images/img.png',
              studentNumber: '67890',
            ),
          ],
        ),
      ),
    );
  }
}
