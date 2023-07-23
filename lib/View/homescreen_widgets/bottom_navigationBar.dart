import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_test_app/View/apis.dart';

import '../../constants/my_colors.dart';
import '../homescreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screen = [const HomeScreen(), const HomeScreen(), const HomeScreen()];

  ValueNotifier<int> screenValue = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: screenValue,
        builder: (context, int dScreenValue, child) {
          return Scaffold(
            backgroundColor: backgroundClr,
            body: screen[dScreenValue],
            bottomNavigationBar: SizedBox(
              // color:Colors.red,
              height: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50, //60
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: my_white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: width,
                      height: 90,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: ValueListenableBuilder(
                          valueListenable: screenValue,
                          builder: (context, int dBottomButton, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    screenValue.value = 0;
                                  },
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: dBottomButton == 0
                                              ? Alignment.topCenter
                                              : Alignment.bottomCenter,
                                          child: dBottomButton == 0
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 33),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          // Shadow color
                                                          spreadRadius: 1,
                                                          // Spread radius of the shadow
                                                          blurRadius: 3,
                                                          // Blur radius of the shadow
                                                          offset: const Offset(
                                                              0,
                                                              4), // Offset of the shadow (0 for x and 2 for y)
                                                        ),
                                                      ],
                                                    ),

                                                    // boxShadow:
                                                    // [BoxShadow(blurRadius: 4, color: Colors.white, spreadRadius: 1)],),
                                                    child: const CircleAvatar(
                                                      radius: 26,
                                                      backgroundColor:
                                                          bottomIconBackground,
                                                      child: CircleAvatar(
                                                        radius: 20, //20
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Icon(
                                                          Icons.person,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 13),
                                                  child: const Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.grey,
                                                      )),
                                                )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    getSubjectDetails();
                                    screenValue.value = 1;
                                  },
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: dBottomButton == 1
                                              ? Alignment.topCenter
                                              : Alignment.bottomCenter,
                                          child: dBottomButton == 1
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 33),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            // Shadow color
                                                            spreadRadius: 1,
                                                            // Spread radius of the shadow
                                                            blurRadius: 3,
                                                            // Blur radius of the shadow
                                                            offset: const Offset(
                                                                0,
                                                                4), // Offset of the shadow (0 for x and 2 for y)
                                                          ),
                                                        ],
                                                      ),
                                                      child: const CircleAvatar(
                                                        radius: 26,
                                                        backgroundColor:
                                                            bottomIconBackground,
                                                        child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            child: Icon(
                                                              Icons.home,
                                                              color: my_white,
                                                            )),
                                                      )),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 13),
                                                  child: const SizedBox(
                                                      width: 40,
                                                      child: Icon(
                                                        Icons.home,
                                                        color: Colors.grey,
                                                      )))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    screenValue.value = 2;
                                  },
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: dBottomButton == 2
                                              ? Alignment.topCenter
                                              : Alignment.bottomCenter,
                                          child: dBottomButton == 2
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 33),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            // Shadow color
                                                            spreadRadius: 1,
                                                            // Spread radius of the shadow
                                                            blurRadius: 3,
                                                            // Blur radius of the shadow
                                                            offset: const Offset(
                                                                0,
                                                                4), // Offset of the shadow (0 for x and 2 for y)
                                                          ),
                                                        ],
                                                      ),
                                                      child: const CircleAvatar(
                                                        radius: 26,
                                                        backgroundColor:
                                                            bottomIconBackground,
                                                        child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            child: Icon(
                                                              Icons.add_chart,
                                                              color: my_white,
                                                            )),
                                                      )),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 13),
                                                  //height/14.909
                                                  child: const Icon(
                                                    Icons.add_chart,
                                                    color: Colors.grey,
                                                  ))),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String home = "assets/newHomeIcon.png";

  String occupaid = "assets/homeOccupiedIcon.png";

  String menu = "assets/menuNewIcon.png";
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final int screenValue;
  final int index;
  final Function(int) onTap;
  final IconData icon;
  final bool isSelected;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.screenValue,
    required this.index,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Align(
              alignment:
                  isSelected ? Alignment.topCenter : Alignment.bottomCenter,
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.blue,
                          // Replace with your desired color
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: Icon(icon,
                                color: Colors
                                    .white), // Replace with your desired icon
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Icon(icon,
                          color: Colors
                              .blue), // Replace with your desired icon and color
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
