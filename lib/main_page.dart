import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:subway_time_table/table_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<RowA> _timeTableRows = [];
  String Name = '';
  String Time =  DateFormat('HH:mm:ss').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _getTimeTableData();
  }

  Future<void> _getTimeTableData() async {
    var response = await http.get(Uri.parse(
        'http://openapi.seoul.go.kr:8088/4c6f72784b6272613735677166456d/json/SearchSTNTimeTableByIDService/1/136/1703/1/1/'));
    var timeTable = timeTableFromJson(response.body);
    setState(() {
      _timeTableRows = timeTable.searchStnTimeTableByIdService.row;
    });
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueGrey,
              width: appWidth,
              height: appHeight / 2,
              child: _timeTableRows == null
                  ? Center(child: CircularProgressIndicator())
                  : Padding(padding: EdgeInsets.all(10),
                child:
                ListView.builder(
                  itemCount: _timeTableRows.length,
                  itemBuilder: (context, index) {
                    index = _timeTableRows.indexWhere(
                            (element) => element.arrivetime < Time);
                    var row = _timeTableRows[index];
                    return ListTile(
                      title: Text(
                          '${row.subwaysname}행 <<< ${row.subwayename}'),
                      subtitle: Text('열차번호 ${row.trainNo}'),
                      trailing: Text(
                          '도착시간 ${row.arrivetime}\n출발시간 ${row.lefttime}'),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              width: appWidth,
              height: appHeight / 2,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Get Subway Time table '),
                  SizedBox(
                    height: 10,
                  ),
                  Text(DateFormat('HH:mm:ss').format(DateTime.now())),
                  SizedBox(
                    height: 10,
                  ),
                  Text(Time),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
