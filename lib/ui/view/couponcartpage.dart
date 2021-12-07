import 'package:flutter/material.dart';
import 'package:halisahacase/extensions/context_extensions.dart';
import 'package:halisahacase/model/match_model.dart';

class CouponCartPage extends StatefulWidget {
  final List<Matches> myCouponList;
  const CouponCartPage({
    Key? key,
    required this.myCouponList,
  }) : super(key: key);

  @override
  _CouponCartPageState createState() => _CouponCartPageState();
}

class _CouponCartPageState extends State<CouponCartPage> {
  double toplamOran(List<Matches> coupon) {
    double toplam = 1;

    for (var element in coupon) {
      toplam *= element.oran;
      toplam = double.parse((toplam).toStringAsFixed(2));
    }
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupon '),
      ),
      body: widget.myCouponList.isNotEmpty ? buildCoupon() : buildEmptyCoupon(),
    );
  }

  Center buildEmptyCoupon() {
    return const Center(
      child: Text('THERE IS NO MATCH IN COUPON'),
    );
  }

  Column buildCoupon() {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: buildMatchDetailsTile(),
        ),
        Expanded(
          flex: 1,
          child: buildCouponDetails(),
        ),
      ],
    );
  }

  Container buildCouponDetails() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: context.paddingHighHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Toplam Iddia Orani:  ' +
                toplamOran(widget.myCouponList).toString()),
            MaterialButton(
              onPressed: () {},
              child: const Text('Kupon Ekle'),
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }

  ListView buildMatchDetailsTile() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.myCouponList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: context.paddingMediumHorizontalMediumVertical,
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.green,
                leading: Text(
                  'Ev Sahibi',
                  style: context.boldsmallWhiteTextStyle,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.myCouponList[index].evSahibi,
                      style: context.boldsmallBlackTextStyle,
                    ),
                    Text(
                      widget.myCouponList[index].deplasman,
                      style: context.boldsmallBlackTextStyle,
                    ),
                  ],
                ),
                trailing: Text(
                  'Deplasman',
                  style: context.boldsmallWhiteTextStyle,
                ),
              ),
              ListTile(
                tileColor: Colors.greenAccent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tahmin: ' + widget.myCouponList[index].tahmin,
                      style: context.smallBlackTextStyle,
                    ),
                    Text(
                      'Oran: ' + widget.myCouponList[index].oran.toString(),
                      style: context.smallBlackTextStyle,
                    ),
                    Text(
                      'Yuzde: ' + widget.myCouponList[index].yuzde.toString(),
                      style: context.smallBlackTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
