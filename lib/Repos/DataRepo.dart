import 'dart:convert';

import 'package:financeapp/models/ChartSampleData.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List getJson() {
  String tmp =
  '[{"icon" : "assets/turkish2.svg", "title" : "Subscription renewal", "dealer" : "PRO Package", "date": "01.10.2019", "amount" : "19.99", "code": "****.****.****. 2368"},'
  '{"icon" : "assets/turkish1.svg", "title" : "Subscription renewal", "dealer" : "PRO Package", "date": "01.10.2019", "amount" : "19.99", "code": "****.****.****. 2368"},'
  '{"icon" : "assets/turkish1.svg", "title" : "Subscription renewal", "dealer" : "PRO Package", "date": "01.10.2019", "amount" : "19.99", "code": "****.****.****. 2368"},'
  '{"icon" : "assets/turkish1.svg", "title" : "Subscription renewal", "dealer" : "PRO Package", "date": "01.10.2019", "amount" : "19.99", "code": "****.****.****. 2368"}]';

  return json.decode(tmp);
}

List<ColumnSeries<ChartSampleData, String>> getRoundedColumnSeries(
    bool isTileView) {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Jan', y: 15),
    ChartSampleData(x: 'Feb', y: 10),
    ChartSampleData(x: 'Mar', y: 30),
    ChartSampleData(x: 'Apr', y: 15),
    ChartSampleData(x: 'May', y: 20),
    ChartSampleData(x: 'Jun', y: 10)
  ];
  return <ColumnSeries<ChartSampleData, String>>[
    ColumnSeries<ChartSampleData, String>(
      selectionSettings: SelectionSettings(
          selectedColor: Colors.yellow,
          enable: true
      ),
      enableTooltip: true,
      width: 0.6,
      color: Color(0xff413DFF),
      dataLabelSettings: DataLabelSettings(
        textStyle: ChartTextStyle(color: Color(0xffA4B1F2)),
        isVisible: true, labelAlignment: ChartDataLabelAlignment.outer,
        alignment: ChartAlignment.center,
      ),
      dataSource: chartData,
      borderRadius: BorderRadius.circular(3),
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.y,
    ),
  ];
}