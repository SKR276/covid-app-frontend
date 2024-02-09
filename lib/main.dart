import 'package:covid_app/pages/menu.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Mainpage());
}
class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}

