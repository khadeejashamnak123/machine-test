import 'package:flutter/material.dart';
import 'package:machine_test_app/View/homescreen_widgets/attendence_summery.dart';
import 'package:machine_test_app/View/homescreen_widgets/feedback_questions.dart';
import 'package:machine_test_app/constants/my_colors.dart';
import 'package:machine_test_app/View/apis.dart';

class CourseList extends StatelessWidget {

  const CourseList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    int? slIndex;
    return ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: subjectDetailsList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              slIndex != index
                  ? Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: InkWell(
                          onTap: () {}, child: AttendenceSummery(index: index)),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Material(
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      slIndex = index;
                    },
                    child: Container(
                      height: 50,

                      // add boxShadow
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              subjectDetailsList[index].name!,
                              style: const TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  getFeedBackData();
                                  _showAlertDialog(context, index);
                                },
                                child: const Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _showAlertDialog(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,

          // title:,
          content: FeedBackQuestions(index: index),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: appbarBlue1,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 9, right: 9, top: 7, bottom: 7),
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      saveFeedback(context);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: appbarBlue2,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 9, right: 9, top: 7, bottom: 7),
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
// Navigator.of(context).pop(); // Close the alert dialog
}
