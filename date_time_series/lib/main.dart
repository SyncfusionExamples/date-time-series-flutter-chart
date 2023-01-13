import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: DateTime(2015, 1, 1, 0), yValue: 1.13),
    ChartSampleData(x: DateTime(2015, 1, 2, 2), yValue: 1.12),
    ChartSampleData(x: DateTime(2015, 1, 3, 3), yValue: 1.08),
    ChartSampleData(x: DateTime(2015, 1, 4, 4), yValue: 1.12),
    ChartSampleData(x: DateTime(2015, 1, 5, 5), yValue: 1.1),
    ChartSampleData(x: DateTime(2015, 1, 6, 6), yValue: 1.12),
    ChartSampleData(x: DateTime(2015, 1, 7, 7), yValue: 1.1),
    ChartSampleData(x: DateTime(2015, 1, 8, 8), yValue: 1.12),
    ChartSampleData(x: DateTime(2015, 1, 9, 9), yValue: 1.16),
    ChartSampleData(x: DateTime(2015, 1, 10, 10), yValue: 1.1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          //Initialize the chart widget
          child: Container(
              height: 500,
              width: 320,
              child: SfCartesianChart(
                  backgroundColor: Colors.white,
                  //Specifying date time interval type as hours
                  primaryXAxis: DateTimeAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      intervalType: DateTimeIntervalType.hours),
                  series: <ChartSeries<ChartSampleData, DateTime>>[
                    LineSeries<ChartSampleData, DateTime>(
                      dataSource: chartData,
                      xValueMapper: (ChartSampleData sales, _) => sales.x,
                      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
                      name: 'Sales',
                    )
                  ])),
        ));
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.yValue});

  final DateTime? x;
  final double? yValue;
}
