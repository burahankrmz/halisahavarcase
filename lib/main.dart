import 'package:flutter/material.dart';
import 'package:halisahacase/ui/view/cardpage.dart';
import 'package:halisahacase/viewmodel/couponviewmodel.dart';
import 'package:provider/provider.dart';

import 'viewmodel/cardpageviewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      ),
      title: 'Material App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CardPageViewModel()),
          ChangeNotifierProvider<CouponViewModel>(
              create: (context) => CouponViewModel())
        ],
        child: const CardPage(),
      ),
    );
  }
}
