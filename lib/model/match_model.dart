// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'dart:convert';

Matches matchesFromJson(String str) => Matches.fromJson(json.decode(str));

String matchesToJson(Matches data) => json.encode(data.toJson());

class Matches {
  Matches({
    required this.evSahibi,
    required this.deplasman,
    required this.tahmin,
    required this.oran,
    required this.yuzde,
    required this.isAdded,
  });

  String evSahibi;
  String deplasman;
  String tahmin;
  double oran;
  int yuzde;
  bool isAdded;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
        evSahibi: json["evSahibi"],
        deplasman: json["deplasman"],
        tahmin: json["tahmin"],
        oran: json["oran"].toDouble(),
        yuzde: json["yuzde"],
        isAdded: false
      );

  Map<String, dynamic> toJson() => {
        "evSahibi": evSahibi,
        "deplasman": deplasman,
        "tahmin": tahmin,
        "oran": oran,
        "yuzde": yuzde,
      };
}
