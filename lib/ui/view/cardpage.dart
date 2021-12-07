import 'package:flutter/material.dart';
import 'package:halisahacase/extensions/context_extensions.dart';
import 'package:halisahacase/ui/view/couponcartpage.dart';
import 'package:halisahacase/viewmodel/cardpageviewmodel.dart';
import 'package:halisahacase/viewmodel/couponviewmodel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CardPageViewModel>(context, listen: false).fetchMatchesData();
  }

  @override
  Widget build(BuildContext context) {
    var listviewcovidmodel = Provider.of<CardPageViewModel>(context);
    TextStyle buttonTextStyle =
        const TextStyle(color: Colors.black, fontSize: 14);
    return Scaffold(
      appBar: buildAppBar(),
      body: listviewcovidmodel.loadingStatus == LoadingStatus.completed
          ? buildGridMatchCard(listviewcovidmodel, buttonTextStyle)
          : buildProgressWidget(),
    );
  }

  Center buildProgressWidget() {
    return const Center(
            child: CircularProgressIndicator(),
          );
  }

  GridView buildGridMatchCard(CardPageViewModel listviewcovidmodel, TextStyle buttonTextStyle) {
    return GridView.builder(
            padding: context.paddingMediumHorizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: listviewcovidmodel.couponData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.2,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return buildMatchCard(listviewcovidmodel, index, buttonTextStyle);
            },
          );
  }

  Card buildMatchCard(CardPageViewModel listviewcovidmodel, int index, TextStyle buttonTextStyle) {
    return Card(
              color: Colors.green.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: context.dynamicHeight(0.02),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'EV SAHIBI',
                                style: context.boldTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                listviewcovidmodel
                                    .couponData[index].evSahibi,
                                style: context.normalTextStyle,
                              ),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                            thickness: 1, color: Colors.white),
                        Column(
                          children: [
                            SizedBox(
                              height: context.dynamicHeight(0.02),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'DEPLASMAN',
                                style: context.boldTextStyle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                listviewcovidmodel
                                    .couponData[index].deplasman,
                                style: context.normalTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Tahmin: ' +
                              listviewcovidmodel.couponData[index].tahmin,
                          style: context.smallWhiteTextStyle,
                        ),
                        const VerticalDivider(
                            thickness: 1, color: Colors.white),
                        Text(
                          'Oran: ' +
                              listviewcovidmodel.couponData[index].oran
                                  .toString(),
                          style: context.smallWhiteTextStyle,
                        ),
                        const VerticalDivider(
                            thickness: 1, color: Colors.white),
                        Text(
                          'Yuzde: ' +
                              listviewcovidmodel.couponData[index].yuzde
                                  .toString(),
                          style: context.smallWhiteTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.02),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: context.dynamicHeight(0.01),
                          bottom: context.dynamicHeight(0.01),
                          right: context.dynamicWidth(0.05)),
                      child: listviewcovidmodel.couponData[index].isAdded ==
                              false
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white70),
                              onPressed: () {
                                Provider.of<CouponViewModel>(context,
                                        listen: false)
                                    .addMacthToCouponCart(listviewcovidmodel
                                        .couponData[index]);
                                listviewcovidmodel
                                    .couponData[index].isAdded = true;
                              },
                              child: Text(
                                'Add To Coupon',
                                style: buttonTextStyle,
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white70),
                              onPressed: () {
                                Provider.of<CouponViewModel>(context,
                                        listen: false)
                                    .removeMatchToCouponCart(
                                  listviewcovidmodel.couponData[index],
                                );
                                listviewcovidmodel
                                    .couponData[index].isAdded = false;
                              },
                              child: Text(
                                'Remove From Coupon Cart',
                                style: buttonTextStyle,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Matches'),
      actions: [
        buildCouponCartBtn(),
      ],
    );
  }

  Stack buildCouponCartBtn() {
    return Stack(
      children: [
        IconButton(
          alignment: Alignment.center,
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: CouponCartPage(
                        myCouponList:
                            Provider.of<CouponViewModel>(context, listen: false)
                                .couponList),
                    type: PageTransitionType.rightToLeft));
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        Positioned(
          child: Stack(
            children: [
              const Icon(
                Icons.brightness_1,
                size: 20.0,
                color: Colors.pink,
              ),
              Positioned(
                top: 3.0,
                bottom: 4.0,
                left: 6.0,
                child: Text(
                  Provider.of<CouponViewModel>(context, listen: true)
                      .couponList
                      .length
                      .toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
