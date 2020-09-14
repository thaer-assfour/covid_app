import 'package:covid_app/myColor.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Widget pieChartWidget(ctx, active, death, recovered) {
  final List<Color> colorList = [
    myColor1[6],
    myColor1[7],
    myColor1[8].withOpacity(0.5),
  ];

  return PieChart(
      animationDuration: Duration(milliseconds: 1000),
      colorList: colorList,
      chartValueLabelColor: Colors.white,
      chartLegendSpacing: MediaQuery.of(ctx).size.width / 10,
      showChartValueLabel: true,
      fontFamily: "SourceSansPro",
      legendFontColor: myColor1[0],
      chartValueFontWeight: FontWeight.w700,
      legendFontWeight: FontWeight.w700,
      chartValuesColor: myColor1[0],
      dataMap: {
        'Active': active.toDouble(),
        'Death': death.toDouble(),
        'Recover': recovered.toDouble()
      });
}
