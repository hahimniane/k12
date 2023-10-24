import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maarif_k12/new_menu_page.dart';
import 'package:maarif_k12/utils/appbar.dart';
import 'package:maarif_k12/utils/const.dart';

import '../../MenuPage.dart';
import '../../utils/bottom_navbar.dart';
import 'announcement_details_page.dart';

// class Announcement extends StatelessWidget {
//   const Announcement({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Get padding and screen dimensions
//     EdgeInsets padding = MediaQuery.of(context).padding;
//     double availableHeight =
//         MediaQuery.of(context).size.height - padding.top - padding.bottom;
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: lightBlueColor,
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Payment status container
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               margin: const EdgeInsets.symmetric(vertical: 14),
//               height: availableHeight * 0.11,
//               width: screenWidth * 0.896,
//               child: ListTile(
//                 leading: const Image(
//                   height: 25,
//                   width: 25,
//                   image: AssetImage('images/payement.png'),
//                 ),
//                 trailing: Text(
//                   'Paid',
//                   style: GoogleFonts.notoSans(
//                       color: parentAppColor, fontWeight: FontWeight.w500),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       appBar: buildAppBar(
//         title: announcementString,
//         context: context,
//         isFromSearch: false,
//       ),
//       bottomNavigationBar: CustomNavigationBar(
//         currentIndex: 0,
//         onTap: (int value) {
//           if (value == 0) {
//             // Navigate to NewMenuPage when the bottom navigation bar item is selected
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const NewMenuPage()));
//           }
//         },
//       ),
//     );
//   }
// }

class AnnouncementHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F7F8),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: parentAppColor,
        title: const Text('Announcements',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          AnnouncementCard(
            isUnread: true,
            icon: Icons.info,
            heading: 'Important Update',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnnouncementDetailsPage(
                            heading: 'Parent Meeting',
                            description:
                                'Degerli Velilerimiz, 25 Haziran Pazar günü veli toplantisi düzenlenecektir. Katilimlarinizi ônemle rica ederiz.',
                          )));
            },
          ),
          AnnouncementCard(
            icon: Icons.event,
            heading: 'Upcoming Event',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {},
          ),
          AnnouncementCard(
            icon: Icons.new_releases,
            heading: 'Latest News',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {},
          ),
          AnnouncementCard(
            icon: Icons.new_releases,
            heading: 'Latest News',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {},
          ),
          AnnouncementCard(
            icon: Icons.new_releases,
            heading: 'Latest News',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {},
          ),
          AnnouncementCard(
            icon: Icons.new_releases,
            heading: 'Latest News',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {},
          ),
          AnnouncementCard(
            icon: Icons.new_releases,
            heading: 'Latest News',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewMenuPage()));
          } else {
            if (kDebugMode) {
              print('search screen');
            }
          }
        },
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String description;
  final bool isUnread;

  final VoidCallback onPressed;

  const AnnouncementCard({
    required this.onPressed,
    required this.icon,
    required this.heading,
    required this.description,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    Color cardColor = isUnread ? parentAppColor : Colors.white;
    Color textColor = isUnread ? Colors.white : parentAppColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: ListTile(
          leading: Icon(
            icon,
            color: textColor,
            size: 32.0,
          ),
          title: Text(
            heading,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: textColor,
                size: 24.0,
              ),
              onPressed: onPressed),
        ),
      ),
    );
  }
}
