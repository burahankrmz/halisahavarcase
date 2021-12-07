import 'package:flutter/cupertino.dart';
import 'package:halisahacase/model/match_model.dart';

class CouponViewModel with ChangeNotifier {
  List<Matches> couponList = <Matches>[];

  void addMacthToCouponCart(Matches matches) {
    couponList.add(matches);
    notifyListeners();
  }

  void removeMatchToCouponCart(Matches matches) {
    couponList.remove(matches);
    notifyListeners();
  }
}