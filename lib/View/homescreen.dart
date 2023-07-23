import 'package:flutter/material.dart';
import 'package:machine_test_app/View/homescreen_widgets/course_list.dart';
import 'package:machine_test_app/View/homescreen_widgets/gradientAppBar.dart';

import '../constants/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundClr,
        body: Stack(
          children: <Widget>[
            const GradientAppBar("My Subjects"),
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: CourseList(),
            ),
          ],
        ));
  }
}
