import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension TextStyleExtension on BuildContext {
  TextStyle get smallBlackTextStyle => const TextStyle(
      color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);
  TextStyle get boldsmallWhiteTextStyle => const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  TextStyle get boldsmallBlackTextStyle => const TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);

      TextStyle get smallWhiteTextStyle =>
        const TextStyle(color: Colors.white, fontSize: 16);
    TextStyle get normalTextStyle =>
        const TextStyle(color: Colors.white, fontSize: 20);
    TextStyle get boldTextStyle => const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
}

extension NumberExtension on BuildContext {
  double get lowHeightValue => dynamicHeight(0.01);
  double get mediumHeightValue => dynamicHeight(0.03);
  double get highHeightValue => dynamicHeight(0.05);
  double get lowWidthValue => dynamicWidth(0.01);
  double get mediumWidthValue => dynamicWidth(0.03);
  double get highWidthValue => dynamicWidth(0.05);
}

extension PaddingExtension on BuildContext {
  EdgeInsets dynamicVerticalPadding(double val) =>
      EdgeInsets.symmetric(vertical: dynamicHeight(val));
  EdgeInsets dynamicHorizontalPadding(double val) =>
      EdgeInsets.symmetric(horizontal: dynamicWidth(val));
  EdgeInsets get paddingAllLow => EdgeInsets.all(dynamicHeight(0.01));
  EdgeInsets get paddingAllHigh => EdgeInsets.all(dynamicHeight(0.03));
  EdgeInsets get paddingMediumHorizontalMediumVertical => EdgeInsets.symmetric(
      vertical: dynamicHeight(0.02), horizontal: dynamicHeight(0.02));
  EdgeInsets get paddingHighHorizontalMediumVertical => EdgeInsets.symmetric(
      vertical: dynamicHeight(0.02), horizontal: dynamicHeight(0.03));
  EdgeInsets get paddingOnlyLeftLow =>
      EdgeInsets.only(left: dynamicHeight(0.01));
  EdgeInsets get paddingOnlyLeftMedium =>
      EdgeInsets.only(left: dynamicHeight(0.02));
  EdgeInsets get paddingOnlyLeftHigh =>
      EdgeInsets.only(left: dynamicHeight(0.03));
  EdgeInsets get paddingOnlyRightLow =>
      EdgeInsets.only(right: dynamicHeight(0.01));
  EdgeInsets get paddingOnlyRightMedium =>
      EdgeInsets.only(right: dynamicHeight(0.02));
  EdgeInsets get paddingOnlyRightHigh =>
      EdgeInsets.only(right: dynamicHeight(0.03));
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.01));
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.02));
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.03));
  EdgeInsets get paddingLowVertical =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.01));
  EdgeInsets get paddingLowMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.015));
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.02));
  EdgeInsets get paddingMediumMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.025));
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.04));
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidgetHeight =>
      SizedBox(height: dynamicHeight(lowHeightValue));
}
