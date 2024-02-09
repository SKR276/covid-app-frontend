// To parse this JSON data, do
//
//     final viewList = viewListFromJson(jsonString);

import 'dart:convert';

List<ViewList> viewListFromJson(String str) => List<ViewList>.from(json.decode(str).map((x) => ViewList.fromJson(x)));

String viewListToJson(List<ViewList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewList {
  String id;
  String patientName;
  String patientPhone;
  String patientAddress;
  String patientSymptom;
  String patientStatus;
  int v;

  ViewList({
    required this.id,
    required this.patientName,
    required this.patientPhone,
    required this.patientAddress,
    required this.patientSymptom,
    required this.patientStatus,
    required this.v,
  });

  factory ViewList.fromJson(Map<String, dynamic> json) => ViewList(
    id: json["_id"],
    patientName: json["patientName"],
    patientPhone: json["patientPhone"],
    patientAddress: json["patientAddress"],
    patientSymptom: json["patientSymptom"],
    patientStatus: json["patientStatus"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "patientName": patientName,
    "patientPhone": patientPhone,
    "patientAddress": patientAddress,
    "patientSymptom": patientSymptom,
    "patientStatus": patientStatus,
    "__v": v,
  };
}
