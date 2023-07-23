import 'package:flutter/material.dart';
import 'package:machine_test_app/View/homescreen_widgets/graph_widget.dart';
import 'package:machine_test_app/View/homescreen_widgets/status_circle.dart';
import 'package:machine_test_app/constants/my_colors.dart';

class AttendenceSummery extends StatelessWidget {
  int index;

  AttendenceSummery({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width * 0.9;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 270,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: width / 1.8,
              color: my_white,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Attendance Summery",
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 18,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  ColumnGraph(index: index)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12, right: 0),
              child: VerticalDivider(
                color: Colors.black,
                thickness: 0.5,
              ),
            ),
            Container(
              width: width / 3,
              color: my_white,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Assignment Status",
                    style: TextStyle(fontSize: 10),
                  ),
                  StatusCircles(index: index)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
