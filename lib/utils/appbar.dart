import 'package:flutter/material.dart';

import 'build_appbar.dart';
import 'const.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;
  final bool isFromSearch;
  int count = 0;
  final bool isAdminColor;

  buildAppBar(
      {super.key,
      required this.title,
      required this.context,
      required this.isFromSearch,
      this.isAdminColor = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        color: Colors.white,
        onPressed: () {
          if (isFromSearch) {
            Navigator.of(context).popUntil((_) => count++ >= 2);
          } else {
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: isAdminColor ? adminAppColor : parentAppColor,
      title: Text(
        textAlign: TextAlign.center,
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
