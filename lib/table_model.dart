import 'dart:convert';

TimeTable timeTableFromJson(String str) => TimeTable.fromJson(json.decode(str));

String timeTableToJson(TimeTable data) => json.encode(data.toJson());

class TimeTable {
  TimeTable({
    required this.searchStnTimeTableByIdService,
  });

  SearchStnTimeTableByIdService searchStnTimeTableByIdService;

  factory TimeTable.fromJson(Map<String, dynamic> json) => TimeTable(
    searchStnTimeTableByIdService: SearchStnTimeTableByIdService.fromJson(
        json["SearchSTNTimeTableByIDService"]),
  );

  Map<String, dynamic> toJson() => {
    "SearchSTNTimeTableByIDService": searchStnTimeTableByIdService.toJson(),
  };
}

class SearchStnTimeTableByIdService {
  SearchStnTimeTableByIdService({
    required this.listTotalCount,
    required this.result,
    required this.row,
  });

  int listTotalCount;
  Result result;
  List<RowA> row;

  factory SearchStnTimeTableByIdService.fromJson(Map<String, dynamic> json) =>
      SearchStnTimeTableByIdService(
        listTotalCount: json["list_total_count"],
        result: Result.fromJson(json["RESULT"]),
        row: List<RowA>.from(json["row"].map((x) => RowA.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "list_total_count": listTotalCount,
    "RESULT": result.toJson(),
    "row": List<dynamic>.from(row.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    code: json["CODE"],
    message: json["MESSAGE"],
  );

  Map<String, dynamic> toJson() => {
    "CODE": code,
    "MESSAGE": message,
  };
}

class RowA {
  RowA({
    required this.lineNum,
    required this.frCode,
    required this.stationCd,
    required this.stationNm,
    required this.trainNo,
    required this.arrivetime,
    required this.lefttime,
    required this.originstation,
    required this.deststation,
    required this.subwaysname,
    required this.subwayename,
    required this.weekTag,
    required this.inoutTag,
    required this.flFlag,
    required this.deststation2,
    required this.expressYn,
    required this.branchLine,
  });

  String lineNum;
  String frCode;
  String stationCd;
  String stationNm;
  String trainNo;
  DateTime arrivetime;
  DateTime lefttime;
  String originstation;
  String deststation;
  String subwaysname;
  String subwayename;
  String weekTag;
  String inoutTag;
  String flFlag;
  String deststation2;
  String expressYn;
  String branchLine;

  factory RowA.fromJson(Map<String, dynamic> json) => RowA(
    lineNum: json["LINE_NUM"],
    frCode: json["FR_CODE"],
    stationCd: json["STATION_CD"],
    stationNm: json["STATION_NM"],
    trainNo: json["TRAIN_NO"],
    arrivetime: json["ARRIVETIME"]  ,
    lefttime: json["LEFTTIME"],
    originstation: json["ORIGINSTATION"],
    deststation: json["DESTSTATION"],
    subwaysname: json["SUBWAYSNAME"], // DateTime.tryParse(json["SUBWAYSNAME"]),
    subwayename: json["SUBWAYENAME"],
    weekTag: json["WEEK_TAG"],
    inoutTag: json["INOUT_TAG"],
    flFlag: json["FL_FLAG"],
    deststation2: json["DESTSTATION2"],
    expressYn: json["EXPRESS_YN"],
    branchLine: json["BRANCH_LINE"],
  );

  Map<String, dynamic> toJson() => {
    "LINE_NUM": lineNum,
    "FR_CODE": frCode,
    "STATION_CD": stationCd,
    "STATION_NM": stationNm,
    "TRAIN_NO": trainNo,
    "ARRIVETIME": arrivetime,
    "LEFTTIME": lefttime,
    "ORIGINSTATION": originstation,
    "DESTSTATION": deststation,
    "SUBWAYSNAME": subwaysname,
    "SUBWAYENAME": subwayename,
    "WEEK_TAG": weekTag,
    "INOUT_TAG": inoutTag,
    "FL_FLAG": flFlag,
    "DESTSTATION2": deststation2,
    "EXPRESS_YN": expressYn,
    "BRANCH_LINE": branchLine,
  };
}
