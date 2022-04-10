// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("NFT Market"),
        centerTitle: false,
        foregroundColor: Colors.pink,
        actions: [
          IconButton(
            splashRadius: 23,
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/shopping_cart.png",
              height: 20,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  topCollection(),
                  const SizedBox(height: 20),
                  created(),
                ],
              ),
            ),
            bottomBar()
          ],
        ),
      ),
    );
  }

  Widget topCollection() {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 375,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Collection",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: .5),
          ),
          SizedBox(
            height: 340,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(
                        right: 18, left: 3, bottom: 3, top: 3),
                    padding: EdgeInsets.all(18),
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(.07),
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/illustration/top_collection.png"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Samadanloke",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    CircleAvatar(
                                      radius: 12,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Bahien",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black54),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 60,
                              width: 90,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffDB05EB),
                                      Color(0xffF33AA2),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(24)),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Reserve Price",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text("3.00 ETH"),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24))),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget created() {
    return Container(
      margin: const EdgeInsets.only(left: 18),
      height: 440,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Created",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: .5),
          ),
          SizedBox(
            height: 409,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(
                        right: 18, left: 3, bottom: 3, top: 3),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: Colors.black.withOpacity(.07),
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                CircleAvatar(
                                  radius: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Bahien",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                            IconButton(
                              splashRadius: 44,
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/icons/triple_point.png",
                                width: 20,
                              ),
                            )
                          ],
                        ),
                        Image.asset("assets/illustration/created.png"),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 56.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200.withOpacity(0.5)),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, i) {
                  return TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      "assets/icons/bottom_navigation_$i.png",
                      height: 22,
                    ),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(i == 0 ? 20 : 0),
                          right: Radius.circular(i == 3 ? 20 : 0),
                        )),
                        minimumSize: Size(
                            (MediaQuery.of(context).size.width - 60) / 4, 50)),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
