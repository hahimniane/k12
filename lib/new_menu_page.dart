import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maarif_k12/parent/Announcement/announcement_home_page.dart';
import 'package:maarif_k12/utils/build_appbar.dart';
import 'package:maarif_k12/utils/const.dart';
import 'package:maarif_k12/utils/navigation_helper.dart';

class NewMenuPage extends StatelessWidget {
  const NewMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double availableHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightBlueColor,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(20.0),
      //   child: AppBar(
      //     // backgroundColor:  Colors.blue,
      //     // backgroundColor: Theme.of(context).primaryColor == adminAppColor
      //     //     ? adminPageBackgroundColor
      //     //     :
      //     backgroundColor: lightBlueColor,
      //     leading: Container(),
      //     actions: [
      //       IconButton(
      //         onPressed: () {
      //           // if (Theme.of(context).primaryColor == adminAppColor) {
      //           //   NavigationHelper.pushPage(
      //           //       context, AdminProfileSelectionPage());
      //           // } else {
      //           //   NavigationHelper.pushPage(
      //           //       context, ParentProfileSelectionPage());
      //           // }
      //         },
      //         icon: const Icon(
      //           Icons.person,
      //           color:
      //               // Theme.of(context).primaryColor == adminAppColor
      //               //     ? adminAppColor:
      //               parentAppColor,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Theme.of(context).primaryColor == adminAppColor
            //?
            Container(
              decoration: const BoxDecoration(
                // color: Colors.orange,
                color: Color(0xffCFF0F1),
                borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(25),
                    // bottomRight: Radius.circular(25),
                    ),
              ),
              height: availableHeight * 0.245,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.yellow,
                      height: availableHeight * 0.07,
                      child: const ListTile(
                        leading: Icon(
                          Icons.search,
                          color: parentAppColor,
                        ),
                        trailing: Icon(
                          Icons.person,
                          color: parentAppColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            // color: Colors.blue,
                            ),
                        height: availableHeight * 0.1456,
                        width: screenWidth * 0.31466,
                        // height: 100,
                        // width: 100,
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: parentAppColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        'Yavuz Selim Celiktas -305',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: parentAppColor),
                      ),
                    ),
                    const Text(
                      '(Student)',
                      style: TextStyle(
                          color: parentAppColor, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 0)
                  ],
                ),
              ),
            )
            // : Container(
            //     decoration: const BoxDecoration(
            //       color: Color(0xffD0F0F1),
            //       borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(25),
            //         bottomRight: Radius.circular(25),
            //       ),
            //     ),
            //     height: MediaQuery.of(context).size.height * 0.20,
            //     width: MediaQuery.of(context).size.width,
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 20.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Expanded(
            //             child: Container(
            //               decoration: const BoxDecoration(),
            //               // color: Colors.blue,
            //               // height: 100,
            //               // width: 200,
            //               child: const CircleAvatar(
            //                 foregroundImage: AssetImage(
            //                   'images/yavuz_selim.jpeg',
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           const Expanded(
            //             flex: 0,
            //             child: Text(
            //               'Yavuz Selim Sultan',
            //               style: TextStyle(fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           const Text('(Öğrenci)'),
            //           const Text('Boy:1.15 cm-kilo: 20')
            //         ],
            //       ),
            //     ),
            //   ),

            ///this contains me

            ,
            Expanded(
              child: Container(
                height: availableHeight,
                color: Colors.white,
                child: Center(
                  child: GridView.count(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      shrinkWrap: false,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 0.3,
                      crossAxisSpacing: 0,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: [
                        _buildMenuItem(
                          // icon: const AssetImage(
                          //     'images/information-speaker-notification-announcement-512.ico'),
                          icon: const AssetImage('images/announcement.png'),
                          label: 'Announcement',
                          color: parentAppColor,
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            // ?
                            NavigationHelper.pushPage(
                                context, const Announcement());
                            // : NavigationHelper.pushPage(
                            //     context,
                            //     AdminAnnouncementPage(),
                            // );
                          },
                        ),
                        _buildMenuItem(
                          icon: AssetImage('images/payement.png'),
                          label: 'Attendance',
                          color: parentAppColor,
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            //     ? NavigationHelper.pushPage(
                            //         context,
                            //         GalleryPage(
                            //           isFromSearch: false,
                            //         ))
                            //     : NavigationHelper.pushPage(
                            //         context,
                            //         AdminGalleryPage(
                            //             // isFromSearch: false,
                            //             ),
                            //       );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.camera_alt,
                          label: 'Schedule',
                          color: const Color(0xff0CA789),
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            //     ? NavigationHelper.pushPage(
                            //         context,
                            //         GalleryPage(
                            //           isFromSearch: false,
                            //         ))
                            //     : NavigationHelper.pushPage(
                            //         context,
                            //         AdminGalleryPage(
                            //             // isFromSearch: false,
                            //             ),
                            //       );
                          },
                        ),
                        _buildMenuItem(
                          // icon: const AssetImage(
                          //     'images/information-speaker-notification-announcement-512.ico'),
                          icon: AssetImage('images/announcement.png'),
                          label: 'Exam Score',
                          color: parentAppColor,
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            // ?
                            NavigationHelper.pushPage(
                                context, const Announcement());
                            // : NavigationHelper.pushPage(
                            //     context,
                            //     AdminAnnouncementPage(),
                            // );
                          },
                        ),
                        _buildMenuItem(
                          icon: AssetImage('images/payement.png'),
                          label: 'Payment',
                          color: parentAppColor,
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            //     ? NavigationHelper.pushPage(
                            //         context,
                            //         GalleryPage(
                            //           isFromSearch: false,
                            //         ))
                            //     : NavigationHelper.pushPage(
                            //         context,
                            //         AdminGalleryPage(
                            //             // isFromSearch: false,
                            //             ),
                            //       );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.camera_alt,
                          label: 'Messages',
                          color: const Color(0xff0CA789),
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            //     ? NavigationHelper.pushPage(
                            //         context,
                            //         GalleryPage(
                            //           isFromSearch: false,
                            //         ))
                            //     : NavigationHelper.pushPage(
                            //         context,
                            //         AdminGalleryPage(
                            //             // isFromSearch: false,
                            //             ),
                            //       );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.camera_alt,
                          label: 'Galerry',
                          color: const Color(0xff0CA789),
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            //     ? NavigationHelper.pushPage(
                            //         context,
                            //         GalleryPage(
                            //           isFromSearch: false,
                            //         ))
                            //     : NavigationHelper.pushPage(
                            //         context,
                            //         AdminGalleryPage(
                            //             // isFromSearch: false,
                            //             ),
                            //       );
                          },
                        ),
                        _buildMenuItem(
                          icon: Icons.camera_alt,
                          label: 'Another',
                          color: parentAppColor,
                          onTap: () {
                            // provider.activeThemeData == ParentTheme.lightTheme()
                            //     ? NavigationHelper.pushPage(
                            //         context,
                            //         GalleryPage(
                            //           isFromSearch: false,
                            //         ))
                            //     : NavigationHelper.pushPage(
                            //         context,
                            //         AdminGalleryPage(
                            //             // isFromSearch: false,
                            //             ),
                            //       );
                          },
                        ),
                        // _buildMenuItem(
                        //   icon: Icons.camera_alt,
                        //   label: 'sdfsdf',
                        //   color: const Color(0xff0CA789),
                        //   onTap: () {
                        //     // provider.activeThemeData == ParentTheme.lightTheme()
                        //     //     ? NavigationHelper.pushPage(
                        //     //         context,
                        //     //         GalleryPage(
                        //     //           isFromSearch: false,
                        //     //         ))
                        //     //     : NavigationHelper.pushPage(
                        //     //         context,
                        //     //         AdminGalleryPage(
                        //     //             // isFromSearch: false,
                        //     //             ),
                        //     //       );
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: Icons.mark_chat_unread_rounded,
                        //   label: 'Messages',
                        //   color: const Color(0xffFAC711),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             MessagesPage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context,
                        //             AdminMessagesPage(
                        //               isFromSearch: false,
                        //             ),
                        //           );
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: FontAwesomeIcons.puzzlePiece,
                        //   label: 'Event Program',
                        //   color: const Color(0xff2D9BF0),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             EtkinlikPage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context, AdminActivityPage());
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: FontAwesomeIcons.plus,
                        //   label: 'Progress Tracking',
                        //   color: const Color(0xff414BB2),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             GelisimTakipPage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context, AdminProgressTrackingHomePage());
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: Icons.restaurant,
                        //   label: 'Food List',
                        //   color: const Color(0xff652CB3),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             FoodPage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context, AdminFoodHomePage());
                        //
                        //     // AdminFoodHomePage
                        //
                        //     // Navigator.push(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //         builder: (context) => FoodPage(
                        //     //               isFromSearch: false,
                        //     //             )));
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: FontAwesomeIcons.heartCrack,
                        //   label: 'Health',
                        //   color: const Color(0xff14CDD4),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             HealthWelcomePage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context, AdminHealthHomePage());
                        //     // NavigationHelper.pushPage(
                        //     //     context,
                        //     //     const HealthWelcomePage(
                        //     //       isFromSearch: false,
                        //     //     ));
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: Icons.checklist,
                        //   label: 'Attendance',
                        //   color: const Color(0xff050039),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             AttendancePage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(context,
                        //             AdminAttendanceStudentInfoInputPage());
                        //
                        //     // NavigationHelper.pushPage(
                        //     //     context,
                        //     //     const AttendancePage(
                        //     //       isFromSearch: false,
                        //     //     ));
                        //   },
                        // ),
                        // _buildMenuItem(
                        //   icon: FontAwesomeIcons.bus,
                        //   label: 'School Service',
                        //   color: const Color(0xffDA0064),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             const ServicePage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context, AdminSchoolServiceHomePage());
                        //
                        //     // NavigationHelper.pushPage(
                        //     //     context,
                        //     //     const ServicePage(
                        //     //       isFromSearch: false,
                        //     //     ));
                        //   },
                        // ),
                        // const SizedBox(),
                        // _buildMenuItem(
                        //   icon: FontAwesomeIcons.bookOpen,
                        //   label: 'School Bulletin',
                        //   color: const Color(0xffF24727),
                        //   onTap: () {
                        //     provider.activeThemeData == ParentTheme.lightTheme()
                        //         ? NavigationHelper.pushPage(
                        //             context,
                        //             SchoolBulettinPage(
                        //               isFromSearch: false,
                        //             ))
                        //         : NavigationHelper.pushPage(
                        //             context, AdminSchoolBulletinHomePage());
                      ]
                      //},
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMenuItem(
    {required var icon,
    required String label,
    Color? color,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon is IconData
              ? Icon(
                  icon,
                  color: color,
                  size: 24,
                )
              : Image(
                  image: icon,
                  height: 40,
                  // color: const Color(0xffF55B5B),
                ),
          const SizedBox(height: 2.0),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    ),
  );
}
