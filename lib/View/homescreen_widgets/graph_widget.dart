import 'package:flutter/material.dart';
import 'package:machine_test_app/Model/subject_details_mode.dart';
import 'package:machine_test_app/View/apis.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnGraph extends StatelessWidget {
  int index;

  ColumnGraph({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 400,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          interval: 1,
          // To remove vertical (X-axis) grid lines, set the major and minor grid line colors to transparent
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          minorGridLines: const MinorGridLines(color: Colors.transparent),
        ),
        primaryYAxis: NumericAxis(
          interval: 20,
          maximum: 100,
          majorGridLines: const MajorGridLines(color: Colors.transparent),
          minorGridLines: const MinorGridLines(color: Colors.transparent),
        ),
        series: buildChartSeries(subjectDetailsList[index]
            .attandence!), // Use the function to generate ChartSeries
      ),
    );
  }
}

List<ChartSeries<Attandence, String>> buildChartSeries(List<Attandence> data) {
  return <ChartSeries<Attandence, String>>[
    ColumnSeries<Attandence, String>(
      dataSource: data,
      xValueMapper: (Attandence data, _) => data.semester,
      yValueMapper: (Attandence data, _) => data.mark,
    ),
  ];
}
