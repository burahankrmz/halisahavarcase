import 'package:flutter/cupertino.dart';
import 'package:halisahacase/model/match_model.dart';
import 'package:halisahacase/services/webservice.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class CardPageViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<Matches> couponData = <Matches>[];
  void fetchMatchesData() async {
    List<Matches> _couponData = await WebService().getMatchesData();

    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    couponData = _couponData;

    if (couponData.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
