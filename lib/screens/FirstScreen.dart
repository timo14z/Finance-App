import 'dart:convert';

import 'package:financeapp/Repos/DataRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';


class FirstScreen extends StatelessWidget {
  
  List _data = getJson();

  @override
  Widget build(BuildContext context) {
    SyncfusionLicense.registerLicense("NT8mJyc2IWhia31ifWN9Z2FoYmF8YGJ8ampqanNiYmlmamlmanMDHmgnNj48YmcpEzQ+Mjo/fTA8Pg==");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200]
                  )
                )
              ),
              child: ListTile(
                leading: InkWell(
                  child: new Container(
                    width: 35.0,
                    height: 35.0,
                    padding: const EdgeInsets.all(0.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.black,),
                  ),
                ),
                title: Center(
                    child:Text("Finance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
                ),
                trailing: InkWell(
                  child: new Container(
                    width: 35.0,
                    height: 35.0,
                    padding: const EdgeInsets.all(0.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Icon(Icons.more_horiz, color: Colors.black,),
                  ),
                ),
        ),
      ))),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Text("Total", style: TextStyle(fontSize: 22, color: Color(0xff6F6F6F), fontWeight: FontWeight.w500),),
            Text("Earning", style: TextStyle(fontSize: 22, color: Color(0xff6F6F6F), fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(5.0),),
            Text("₺6011.00", style: TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),),
            Text("Since May 2019", style: TextStyle(fontSize: 14, color: Color(0xff6F6F6F)),),
            Divider(color: Color(0xffFFD600),),
            Padding(padding: EdgeInsets.only(top:45),),
            Container(
              padding: EdgeInsets.fromLTRB(21, 23, 21, 23),
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xff203290),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Completed tasks income",
                            style: TextStyle(color: Color(0xffA4B1F2), fontWeight: FontWeight.bold, fontSize: 14),),
                          Expanded(flex: 1,child: Container(),),
                          ButtonTheme(
                            minWidth: 70,
                            height: 21,
                            child: RaisedButton(

                              onPressed: (){
                                final action = CupertinoActionSheet(
                                  actions: <Widget>[
                                    CupertinoActionSheetAction(
                                      child: Text("Action 1"),
                                      isDefaultAction: true,
                                      onPressed: () {
                                        print("Action 1 is been clicked");
                                      },
                                    ),
                                    CupertinoActionSheetAction(
                                      child: Text("Action 2"),
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        print("Action 2 is been clicked");
                                      },
                                    )
                                  ],
                                );
                                showCupertinoModalPopup(
                                    context: context, builder: (context) => action);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                              ),
                              padding: EdgeInsets.fromLTRB(21, 2, 21, 2),
                              color: Color(0xff3048C4),
                              child: Text("2019",
                                style: TextStyle(color: Color(0xffFFFFFF),fontSize: 14, fontWeight: FontWeight.bold),),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("₺1510.00",
                          style: TextStyle(color: Color(0xffFFFFFF), fontWeight: FontWeight.bold, fontSize: 36),),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 200, width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topCenter,
                      child:SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          labelStyle: ChartTextStyle(color: Color(0xffA4B1F2)),
                          axisLine: AxisLine(width: 0,),
                          labelPosition: ChartDataLabelPosition.outside,
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          isVisible: false,
                          labelPosition: ChartDataLabelPosition.outside,
                          labelStyle: ChartTextStyle(fontSize: 0),
                          minimum: 0,
                          maximum: 35,
                          interval: 6.6,
                          axisLine: AxisLine(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines()//MajorGridLines(width: 1,color: Color(0xffA4B1F2)),

                        ),
                        series: getRoundedColumnSeries(true),
                        tooltipBehavior: TooltipBehavior(
                            enable: true,
                            canShowMarker: false,
                            format: 'point.x : point.y',
                            header: '')
                      )
                      ),
                  ),
                ],
              ),

            ),
            Padding(padding: EdgeInsets.only(top: 58),),
            Text("Transactions History", style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.only(top: 29),),
            Center(
              child: new ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: _data.length,
                  padding: const EdgeInsets.only(left: 10.0),
                  itemBuilder: (BuildContext context, int position) {
                    return Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(_data[position]['icon'],
                              color: Colors.black,
                              height: 28,
                              width: 28,
                            ),
                            Padding(padding: EdgeInsets.only(left: 22),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${_data[position]['title']}",
                                  style: new TextStyle(fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${_data[position]['dealer']}",
                                  style: new TextStyle(fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(padding: EdgeInsets.only(top: 13),),
                                Text(
                                  "${_data[position]['date']}",
                                  style: new TextStyle(fontSize: 14,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Expanded(flex: 1,child: Container(),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "${_data[position]['amount']}",
                                  style: new TextStyle(fontSize: 25,
                                      color: Color(0xffE91D2D),
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(padding: EdgeInsets.only(top: 15),),
                                Text(
                                  "${_data[position]['code']}",
                                  style: new TextStyle(fontSize: 14,
                                      color: Color(0xff6F6F6F),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),

                        new Divider(height: 25.0),
                      ],
                    );
                  }),
            ),
            Padding(padding: EdgeInsets.only(top: 32.5),),
            ButtonTheme(
              minWidth: 70,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                padding: EdgeInsets.fromLTRB(78, 15, 78, 15),
                onPressed: (){},
                color: Color(0xffFFD600),
                child: Text("View all transactions",
                  style: TextStyle(color: Colors.black,fontSize: 14, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}




