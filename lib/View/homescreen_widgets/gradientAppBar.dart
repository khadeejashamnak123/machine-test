import 'package:flutter/material.dart';
import 'package:machine_test_app/constants/my_colors.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 160.0;

  const GradientAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: <Color>[appbarBlue1, appbarBlue2]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Aligns the icon at the start and the title at the center.
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: my_white,
              )),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 48),
          // Optional: Adjust the width as needed to create space between the icon and the title.
        ],
      ),
    );
  }
}
