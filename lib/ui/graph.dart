import 'package:convert_test/component/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
class Graph extends StatefulWidget {


  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  double one = 1.1;
  double two = 2.1;
  double three = 3.1;
  double four = 4.1;
  double five = 5.1;
  double six = 6.1;
  double seven =7.1;
  int index =0;
  var list = ['Past 30 Days','Past 90 Days'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius:const BorderRadius.only(
          topLeft:Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
               const SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: list.map((e){
                        int i = list.indexOf(e);
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              index=i;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: text(e, 20,
                                    color:index==i?Colors.white:Colors.grey, ),
                              ),
                            ),
                          ),
                        );
                      }
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          SfCartesianChart(
            // Initialize category axis
              primaryXAxis: CategoryAxis(),

              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                    dataSource:  <SalesData>[
                      SalesData('Sun', one),
                      SalesData('Mon', two),
                      SalesData('Tue', three),
                      SalesData('Wed', four),
                      SalesData('Thur', five),
                      SalesData('Fri', six),
                      SalesData('Sat', seven)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales
                )
              ]
          ),
         const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              Text("Get rate alert straight to your emai inboxl",
                style:TextStyle(
                  fontWeight:FontWeight.w600,
                  decoration:TextDecoration.underline,
                  color:Colors.white,
                  fontSize: 13,
                ),),
              SizedBox(width: 10,),
            ],
          ),
          const SizedBox(height: 30,),

        ],
      ),
    );
  }
}
