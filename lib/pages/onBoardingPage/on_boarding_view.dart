import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/animated_button.dart';
import 'package:nft_marketplace/core/onBoarding_counter.dart';
import 'package:nft_marketplace/pages/markerPage/market_view.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    LinearGradient linearGradient = const LinearGradient(
      colors: [
        Colors.white,
        Color(0xffE1ACF5),
        Color(0xffD58BF1),
        Color(0xffA508E1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: linearGradient),
      child: Stack(
        children: [
          PageView.builder(
              onPageChanged: (index) => setState(() => page = index),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [illustration(), messageBox()],
                );
              }),
          Align(
              alignment: const Alignment(0, -.75),
              child: OnBoradingCounter(index: page)),
          Align(
              alignment: const Alignment(0, .9),
              child: AnimatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MarketPage()));
                },
                text: "Get started now",
                textColor: Colors.white,
                width: 190,
                linearGradient: const LinearGradient(
                  colors: [
                    Color(0xffDB05EB),
                    Color(0xffF33AA2),
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  Widget illustration() {
    return Align(
        alignment: const Alignment(0, -.5),
        child: Image.asset("assets/illustration/on_borading_illustration.png"));
  }

  Widget messageBox() {
    return Align(
      alignment: const Alignment(0, .5),
      child: Container(
        height: 184,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "A new NFT experience",
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 1),
                    blurRadius: 1,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Node is platform that aims to build a new creative economy",
                style: TextStyle(
                  letterSpacing: .4,
                  height: 1.5,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
