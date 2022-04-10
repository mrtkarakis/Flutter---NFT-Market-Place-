import 'package:flutter/material.dart';
import 'package:nft_marketplace/pages/onBoardingPage/on_boarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          primarySwatch: Colors.blue,
        ),
        home: const OnBoardingPage());
  }
}
