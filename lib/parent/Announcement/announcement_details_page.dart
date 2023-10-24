import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maarif_k12/new_menu_page.dart';

import '../../utils/bottom_navbar.dart';
import '../../utils/const.dart';
import '../../utils/pdf_viewer_page.dart';

class AnnouncementDetailsPage extends StatelessWidget {
  final String heading;
  final String description;

  const AnnouncementDetailsPage({
    super.key,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F7F8),
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: parentAppColor,
        title: const Text(
          'Announcement Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
              flex: 18,
              child: Container(
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width * 1.0,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      // color: Colors.brown,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              heading,
                              style: const TextStyle(
                                color: parentAppColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            description,
                            style: const TextStyle(
                              color: parentAppColor,
                              wordSpacing: 3,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Toplantida ele alinacak konular;',
                            style: TextStyle(
                              color: parentAppColor,
                              wordSpacing: 3,
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            color: Colors.orange,
                            height: 320,
                            child: ListView(
                              padding: const EdgeInsets.all(16.0),
                              children: [
                                buildListTile(string: 'Yemek Menusu'),
                                buildListTile(string: 'Ders Programlari'),
                                buildListTile(string: 'Vaz Okulu Takvimi'),
                                buildListTile(string: 'Gezi Planlari'),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'Attachment',
                                  style: TextStyle(
                                    color: parentAppColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SyncVisionPdfViewer(
                                                pdfSource:
                                                    'https://firebasestorage.googleapis.com/v0/b/maarif-567b8.appspot.com/o/School%20Health%20Information%20Form.pdf?alt=media&token=3e23d985-79cd-4bf3-863d-69945257b082&_gl=1*1weoa31*_ga*Mjg1MTAxOTg3LjE2ODIyNDk0MzA.*_ga_CW55HF8NVT*MTY4NjY1MjM1Mi4zMS4xLjE2ODY2NTI0NDYuMC4wLjA.',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          FontAwesomeIcons.solidFilePdf,
                                          size: 30,
                                          color: Color(0xffC30D05),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        FontAwesomeIcons.solidFilePdf,
                                        size: 30,
                                        color: Color(0xffC30D05),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewMenuPage()));
          }
        },
      ),
    );
  }

  ListTile buildListTile({required String string}) {
    return ListTile(
      leading: const Text('\u2022',
          style: TextStyle(
            fontSize: 16,
            color: parentAppColor,
          )), // Unicode bullet character
      title: Text(
        string,
        style: const TextStyle(
          color: parentAppColor,
        ),
      ),
    );
  }
}

class PersistentBottomBarScaffold extends StatefulWidget {
  /// pass the required items for the tabs and BottomNavigationBar
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Check if the current tab can be popped
        if (widget.items[_selectedTab].navigatorKey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorKey?.currentState?.pop();
          return false;
        } else {
          // If the current tab can't be popped, use the root navigator
          return true;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
                    key: page.navigatorKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.tab)
                      ];
                    },
                  ))
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) {
            if (index == _selectedTab) {
              // Handle the home icon click
              widget.items[_selectedTab].navigatorKey?.currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _selectedTab = index;
              });
            }
          },
          items: widget.items
              .map(
                (item) => BottomNavigationBarItem(
                  backgroundColor:
                      _selectedTab == 0 ? Colors.white : Colors.black,
                  tooltip: item.title,
                  icon: Icon(item.icon),
                  label: item.title,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
      this.navigatorKey,
      required this.title,
      required this.icon});
}

enum SourceType { file, url, asset }
