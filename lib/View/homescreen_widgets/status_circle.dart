import 'package:flutter/material.dart';
import 'package:machine_test_app/View/apis.dart';

class StatusCircles extends StatelessWidget {
  int index;

  StatusCircles({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      // height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: subjectDetailsList[index].assignmentStatus?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var item = subjectDetailsList[index].assignmentStatus?[index];
                  return Column(
                    children: [
                      CircleWithText(
                        gradientStart: Colors.orange,
                        gradientEnd: Colors.yellow,
                        text: item!.status.toString(),
                        count: item.value.toString(),
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text("Aug.\n 25"),
        ],
      ),
    );
  }
}

class CircleWithText extends StatelessWidget {
  final Color gradientStart;
  final Color gradientEnd;
  final String text;
  final String count;

  const CircleWithText({
    super.key,
    required this.gradientStart,
    required this.gradientEnd,
    required this.text,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      count,
                      style: const TextStyle(
                        fontSize: 6,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 6,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
