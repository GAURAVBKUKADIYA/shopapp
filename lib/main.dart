import 'package:flutter/material.dart';
import 'package:shopapp/cruveprc.dart';
import 'package:shopapp/view/LoginScreen.dart';
import 'package:shopapp/view/ProductApiList.dart';
import 'package:shopapp/view/Welcomepage.dart';
import 'package:shopapp/view/tabbar.dart';


import 'ViewScreen.dart';

void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:ProductApiList(),
    );
  }
}

