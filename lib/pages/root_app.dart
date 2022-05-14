import 'package:flutter/material.dart';
import 'package:shop_ui/Json/constant.dart';
import 'package:shop_ui/Themes/Color.dart';
import 'package:shop_ui/pages/home_page.dart';
import 'package:shop_ui/pages/store_page.dart';

import 'account_page.dart';
import 'cart_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  //appBar
  AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        StorePage(),
        AccountPage(),
        CartPage(),
        Center(
          child: Text(
            'MORE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(itemsTab.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
              icon: Icon(
                itemsTab[index]['icon']!,
                size: itemsTab[index]['size'],
                color: activeTab == index ? accent : black,
              ),
            );
          }),
        ),
      ),
    );
  }

  PreferredSizeWidget? getAppBar() {
    switch (activeTab) {
      case 0:
        appBar = null;
        break;
      case 1:
        appBar = null;
        break;
      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: const Text(
            'ACCOUNT',
            style: TextStyle(
              color: black,
            ),
          ),
          centerTitle: true,
        );
        break;
      case 3:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: const Text(
            'CART',
            style: TextStyle(
              color: black,
            ),
          ),
          centerTitle: true,
        );
      case 4:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          title: const Text(
            'MORE',
            style: TextStyle(
              color: black,
            ),
          ),
          centerTitle: true,
        );

      default:
        return AppBar();
    }
  }
}
