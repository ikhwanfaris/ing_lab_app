import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ing_lab_app/utils/constant.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  final String innerTitle;
  final Map<String, double> mapData;
  final List<Color> listColor;

  const CustomWidget(
      {super.key,
      required this.title,
      required this.innerTitle,
      required this.mapData,
      required this.listColor});

  @override
  Widget build(BuildContext context) {
    var totalData = mapData.values;
    var result = totalData.reduce((sum, element) => sum + element).toInt();
    if (kDebugMode) {
      print(result);
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: styles.heading5,
            ),
          ),
          Row(
            children: [
              PieChart(
                dataMap: mapData,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                colorList: listColor,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 10,
                centerWidget: SizedBox(
                  height: 50,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        result.toString(),
                        style: styles.heading6,
                      ),
                      Text(
                        innerTitle,
                        style: styles.heading7,
                      ),
                    ],
                  ),
                ),
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 0,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
              SizedBox(
                width: 70,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: mapData.length,
                    itemBuilder: (context, index) {
                      return Text(
                          mapData.values.elementAt(index).toInt().toString());
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
