import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Json/constant.dart';
import '../Themes/Color.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(profileUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const Text(
                'Nathan',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Member since 2022',
                style: TextStyle(
                  fontSize: 13,
                  color: black.withOpacity(0.7),
                ),
              ),
                  const SizedBox(height: 10,),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                    onPressed: null,
                    child: const Text('EDIT ACCOUNT', style: TextStyle(color: white, fontSize: 13)),
                  ),
            ])
          ]),
        ),
        const SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.only(left:15, right:15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.shopping_bag_sharp, color: black,),
                  SizedBox(width: 10),
                  Text('Orders', style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.location_on_sharp, color: black),
                  SizedBox(width: 10),
                  Text('My Address', style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.settings, color: black),
                  SizedBox(width: 10),
                  Text('Settings', style: TextStyle(fontSize: 15)),
                ]
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Divider(
          thickness: 1, // Espessura da linha do divider
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children:List.generate(accountList.length, (index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(accountList[index], style: const TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward_ios, color: black.withOpacity(0.5), size: 17)
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      thickness: 1
                    )
                  ]
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
