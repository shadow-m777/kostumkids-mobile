import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ActivityIndicatorWidget extends StatelessWidget {
  const ActivityIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          : const CupertinoActivityIndicator(radius: 16.0),
    );
  }
}
