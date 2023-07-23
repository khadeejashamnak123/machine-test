import 'package:flutter/material.dart';
import 'package:machine_test_app/View/homescreen_widgets/radiobttn.dart';
import 'package:machine_test_app/constants/my_colors.dart';

class FeedBackQuestions extends StatelessWidget {
  int index;

  FeedBackQuestions({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 300,
      width: width,
      decoration: const BoxDecoration(color: my_white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Icon(
                      Icons.messenger_outline,
                      color: appbarBlue2,
                      size: 14,
                    ),
                  ),
                  Text(
                    "Feedback Questions",
                    style: TextStyle(fontSize: 14, color: appbarBlue1),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      '08/10',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 0.3,
            color: textColor,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "1. Ability to Integrate content with courses",
              style: TextStyle(fontSize: 12),
            ),
          ),
          RadioOptions(),
        ],
      ),
    );
  }
}
