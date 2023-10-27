import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:maarif_k12/new_menu_page.dart';

import '../../utils/appbar.dart';
import '../../utils/bottom_navbar.dart';
import '../../utils/const.dart';

class AttendancePage extends StatefulWidget {
  final bool isFromSearch;
  const AttendancePage({super.key, required this.isFromSearch});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Attendance',
        context: context,
        isFromSearch: widget.isFromSearch,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Card(
                  elevation: 0.5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Profile Photo
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  AssetImage('images/yavuz_selim.jpeg'),
                            ),
                            const SizedBox(width: 10.0),

                            // Profile Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yavuz Selim CelikTas',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Center(
                                    child: Text(
                                      '351',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(height: 8.0),
                                  // Row(
                                  //   children: [
                                  //     AutoSizeText(
                                  //       'Height: ',
                                  //       style: TextStyle(
                                  //         color: Theme.of(context).primaryColor,
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 15.0,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       '1.2 m',
                                  //       style: TextStyle(
                                  //           color:
                                  //               Theme.of(context).primaryColor),
                                  //     ),
                                  //     Expanded(child: SizedBox(width: 16.0)),
                                  //     Text(
                                  //       'Weight: ',
                                  //       style: TextStyle(
                                  //         fontSize: 15.0,
                                  //         color: Theme.of(context).primaryColor,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       '30 kg',
                                  //       style: TextStyle(
                                  //         fontSize: 14,
                                  //         color: Theme.of(context).primaryColor,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(height: 1.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Center(
                        //   child: Text(
                        //     ' June 16, 2023',
                        //     style: TextStyle(
                        //         fontSize: 16.0,
                        //         color: Theme.of(context).primaryColor,
                        //         fontWeight: FontWeight.w600),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0.2,
                  thickness: 2,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          DatePickerWidget(),
          const SizedBox(
            height: 15,
          ),
          CustomContainerRow()
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewMenuPage()));
          } else if (value == 1) {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }

  @override
  void initState() {
    print('enter was here');
    super.initState();
    AcademicMonthsAttendance academicMonthsAttendance =
        AcademicMonthsAttendance();
    List<String> attendenceList =
        academicMonthsAttendance.generateAttendanceList(
      DateTime(2023, 6, 1), // Academic month start date (1st September 2023)
      DateTime(2023, 6, 10), // Academic month end date (30th September 2023)
    );

    print(attendenceList.first);
    print(attendenceList[1]);
  }
}

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Text(
              'Date',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomDatePicker(),
        const SizedBox(
          width: 10,
        ),
        RoundedIconContainer(
          icon: Icons.arrow_forward_sharp,
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      DateTime? picked;
      await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DateTimePickerWidget(
                initDateTime: selectedDate,
                onConfirm: (newDate, value) {
                  setState(() {
                    selectedDate = newDate;
                  });
                  print('this is the date time $newDate');
                  print('this is the value $value');
                },
                dateFormat: 'dd-MMMM-yyyy',
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     CupertinoButton(
              //       child: Text('Cancel'),
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //     CupertinoButton(
              //       child: Text('OK'),
              //       onPressed: () {
              //         Navigator.of(context).pop(picked);
              //       },
              //     ),
              //   ],
              // ),
            ],
          );
        },
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked!;
        });
      }
    } else {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              primaryColor: Colors.grey,
              // accentColor: Colors.grey,
              colorScheme: ColorScheme.dark(primary: Colors.grey),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Text(
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Theme.of(context)
              .primaryColor, // Change this color to your desired color
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class RoundedIconContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const RoundedIconContainer(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: backgroundColor, // Change this color to whatever you need
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}

class CustomContainerRow extends StatefulWidget {
  const CustomContainerRow({super.key});

  @override
  _CustomContainerRowState createState() => _CustomContainerRowState();
}

class _CustomContainerRowState extends State<CustomContainerRow> {
  String selectedContainer = "Month";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Date',
                    style: TextStyle(
                        color: parentAppColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Expanded(
                  child: Text(
                'Lessons',
                style: TextStyle(
                    color: parentAppColor, fontWeight: FontWeight.bold),
              ))

              // _buildContainer("Semester"),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _buildCardList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String containerName) {
    bool isActive = selectedContainer == containerName;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainer = containerName;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isActive ? parentAppColor : Colors.white,
            border: Border.all(color: parentAppColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              containerName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isActive ? Colors.white : parentAppColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardList() {
    List<String> cardData;

    if (selectedContainer == "Month") {
      cardData = [
        "Card 1 for Month",
        "Card 2 for Month",
        "Card 3 for Month",
        "Card 3 for Month"
      ];
    } else if (selectedContainer == "Term") {
      cardData = ["Card 1 for Term", "Card 2 for Term"];
    } else if (selectedContainer == "Semester") {
      cardData = [
        "Card 1 for Semester",
        "Card 2 for Semester",
        "Card 3 for Semester",
        "Card 4 for Semester",
        "Card 4 for Semester"
      ];
    } else {
      // Handle any other container name or set a default value
      cardData = [];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, i) {
              int index = i + 1;
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '${DateTime.now().add(Duration(days: index)).day.toString()} ${months[DateTime.now().month]}',
                          style: const TextStyle(
                              color: parentAppColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          attendanceWidgetBuilder(
                            index: 1,
                          ),
                          attendanceWidgetBuilder(
                            index: 2,
                          ),
                          attendanceWidgetBuilder(
                            image: 'images/absentIcon.png',
                            index: 3,
                          ),
                          attendanceWidgetBuilder(
                            image: 'images/absentIcon.png',
                            index: 4,
                          ),
                          attendanceWidgetBuilder(
                            image: 'images/absentIcon.png',
                            index: 5,
                          ),
                          attendanceWidgetBuilder(
                            image: 'images/absentIcon.png',
                            index: 6,
                          ),
                          attendanceWidgetBuilder(
                            image: 'images/absentIcon.png',
                            index: 7,
                          ),
                          attendanceWidgetBuilder(
                            image: 'images/absentIcon.png',
                            index: 8,
                          ),
                        ],
                      ),
                    )
                  ]);
            },
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Number of Absenteeism: ',
                  style: TextStyle(
                      color: parentAppColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                TextSpan(
                  text: '12',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: parentAppColor,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class attendanceWidgetBuilder extends StatelessWidget {
  final String image;
  final int index;
  const attendanceWidgetBuilder({
    super.key,
    required this.index,
    this.image = 'images/studentPresentIcon.png',
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              (index).toString(),
              style: const TextStyle(
                  color: parentAppColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              image,
              height: 25,
              width: 25,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class AcademicMonthsAttendance {
  List<String> generateAttendanceList(
    DateTime startDate,
    DateTime endDate,
  ) {
    List<String> attendanceList = [];

    while (startDate.isBefore(endDate)) {
      if (!isWeekend(startDate)) {
        DateTime weekEndDate = startDate;
        String month = startDate.month.toString().padLeft(2, '0');
        String startDay = startDate.day.toString().padLeft(2, '0');

        // Find the end date for the week (5 weekdays from the start date)
        for (int i = 0; i < 4; i++) {
          weekEndDate = weekEndDate.add(Duration(days: 1));
          while (isWeekend(weekEndDate)) {
            weekEndDate = weekEndDate.add(Duration(days: 1));
          }
        }

        String endDay = weekEndDate.day.toString().padLeft(2, '0');
        String formattedDate = '$startDay-$endDay $month';
        attendanceList.add(formattedDate);

        startDate = weekEndDate.add(Duration(days: 1)); // Move to the next week
      } else {
        startDate = startDate.add(Duration(days: 1)); // Skip weekends
      }
    }

    return attendanceList;
  }

  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }
}
// class AcademicMonthsAttendance {
//   List<String> generateAttendanceList(DateTime startDate, DateTime endDate) {
//     List<String> attendanceList = [];
//
//     while (startDate.isBefore(endDate)) {
//       DateTime nextDate = startDate.add(Duration(days: 1));
//       if (!isWeekend(nextDate)) {
//         String month = startDate.month.toString().padLeft(2, '0');
//         String day = startDate.day.toString().padLeft(2, '0');
//         String formattedDate = '$day-$month ${nextDate.day}-$month';
//         attendanceList.add(formattedDate);
//       }
//       startDate = nextDate;
//     }
//
//     return attendanceList;
//   }
//
//   bool isWeekend(DateTime date) {
//     return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
//   }
// }

// class CustomContainerRow extends StatefulWidget {
//   @override
//   _CustomContainerRowState createState() => _CustomContainerRowState();
// }
//
// class _CustomContainerRowState extends State<CustomContainerRow> {
//   bool isMonthActive = true;
//   bool isTermActive = false;
//   bool isSemesterActive = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildContainer("Month", isMonthActive, () {
//           _onContainerTapped("Month");
//         }),
//         _buildContainer("Term", isTermActive, () {
//           _onContainerTapped("Term");
//         }),
//         _buildContainer("Semester", isSemesterActive, () {
//           _onContainerTapped("Semester");
//         }),
//       ],
//     );
//   }
//
//   Widget _buildContainer(String text, bool isActive, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(2),
//         decoration: BoxDecoration(
//           color: isActive ? MainColor : Colors.white,
//           border: Border.all(color: MainColor),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: isActive ? Colors.white : MainColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _onContainerTapped(String containerName) {
//     setState(() {
//       isMonthActive = containerName == "Month";
//       isTermActive = containerName == "Term";
//       isSemesterActive = containerName == "Semester";
//     });
//   }
// }
List months = [
  'jan',
  'feb',
  'mar',
  'april',
  'may',
  'jun',
  'july',
  'aug',
  'sep',
  'oct',
  'nov',
  'dec'
];
// List attendenceList = [
//   '1-5 September',
//   '8-12 September',
//   '15-19 September',
//   '22-26 September',
//   '29 September - 3 October',
//   '6-10 October',
//   '13-17 October',
//   '20-24 October',
//   '27-31 October',
//   '3-7 November',
//   '10-14 November',
//   '17-21 November',
//   '24-28 November',
//   '1-5 December',
//   '8-12 December',
//   '15-19 December',
//   '22-26 December',
//   '29 December - 2 January',
//   '5-9 January',
//   '12-16 January',
//   '19-23 January',
//   '26-30 January',
//   '2-6 February',
//   '9-13 February',
//   '16-20 February',
//   '23-27 February',
//   '2-6 March',
//   '9-13 March',
//   '16-20 March',
//   '23-27 March',
//   '30 March - 3 April',
//   '6-10 April',
//   '13-17 April',
//   '20-24 April',
//   '27 April - 1 May',
//   '4-8 May',
//   '11-15 May',
//   '18-22 May',
//   '25-29 May',
//   '1-5 June',
//   '8-12 June',
//   '15-19 June',
//   '22-26 June',
//   '29 June - 3 July',
// ];
