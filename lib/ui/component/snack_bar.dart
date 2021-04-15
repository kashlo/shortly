import 'package:flutter/material.dart';

import '../theme.dart';

class LSSnackBar {
  static SnackBar init(String? message) {
    return SnackBar(
      margin: EdgeInsets.symmetric(
        horizontal: ThemeProvider.horizontalPadding,
        vertical: 20
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: ThemeProvider.red,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Error', style: TextStyle(color: ThemeProvider.white, fontSize: 22)),
          if (message != null) Text(
            message,
            style: TextStyle(color: ThemeProvider.white, fontSize: 18)
          )
        ],
      )
    );
  }
}
