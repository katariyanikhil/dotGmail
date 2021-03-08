import 'package:dotgmail/constants/appConstant.dart';
import 'package:dotgmail/dotTrickScreen.dart';
import 'package:dotgmail/plusTrickScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar(context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                text: 'dot Trick',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DotTrickScreen()));
                },
              ),
              SizedBox(
                width: screenWidthSize(80, context),
              ),
              MyButton(
                text: 'plus Trick',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlusTrickScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
