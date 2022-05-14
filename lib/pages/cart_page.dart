import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Json/constant.dart';
import '../Themes/Color.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: List.generate(
            cartList.length,
            (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20, top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(cartList[index]['img']),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartList[index]['name'],style: const TextStyle(fontSize: 22)),
                            const SizedBox(height:10),
                            Text('ref ' + cartList[index]['ref'],style: TextStyle(fontSize: 13, color: black.withOpacity(0.7))),
                            const SizedBox(height:10),
                            Text(cartList[index]['size'],style: const TextStyle(fontSize: 22)),
                            const SizedBox(height:10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(cartList[index]['price'], style: const TextStyle(fontSize: 22)),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: black.withOpacity(0.5),)
                                      ),
                                      child: Center(child: Icon(Icons.remove,size: 10, color: black.withOpacity(0.5),)),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Text('1', style: TextStyle(fontSize: 18)),
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: black.withOpacity(0.5),)
                                      ),
                                      child: Center(child: Icon(Icons.add, size: 10, color: black.withOpacity(0.5))),
                                    ),
                                  ]
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              );
            },
          ),
        ),
        Divider(color: grey.withOpacity(0.8)),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text('Do you have a promotion code?', style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 15),
        Divider(color: grey.withOpacity(0.8)),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Delivery', style: TextStyle(fontSize: 16)),
              Text('Standard - Free', style: TextStyle(fontSize: 16)),

            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(50/2),
            ),
            child: Center(child: Text('Buy for \$70'.toUpperCase(), style: const TextStyle(color: white, fontWeight: FontWeight.bold)))
          ),
        ),
      ],
    );
  }
}
