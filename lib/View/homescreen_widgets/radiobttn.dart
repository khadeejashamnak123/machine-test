import 'package:flutter/material.dart';
import 'package:machine_test_app/View/apis.dart';

class RadioOptions extends StatefulWidget {
  RadioOptions({Key? key}) : super(key: key);
  int? selectedIndex;

  @override
  State<RadioOptions> createState() => _RadioOptionsState();
}

class _RadioOptionsState extends State<RadioOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            visualDensity: VisualDensity.compact,
          ),
          child: ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: dataList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var item = dataList[index];
                return ListTile(
                  title: Text(item.name),
                  leading: Radio(
                    value: index,
                    groupValue: widget.selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedIndex = index;
                        // Update the isSelected property of the corresponding DataItem
                        dataList[index].isSelected = true;
                      });
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
