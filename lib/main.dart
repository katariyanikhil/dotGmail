import 'package:dotgmail/constants/appConstant.dart';
import 'package:dotgmail/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
      ),
      home: WelcomeLogo(),
    );
  }
}

class WelcomeLogo extends StatefulWidget {
  @override
  _WelcomeLogoState createState() => _WelcomeLogoState();
}

class _WelcomeLogoState extends State<WelcomeLogo> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: screenHeightSize(650, context),
            ),
            Image.asset(
              'assets/images/appLogo.png',
              height: screenWidthSize(200, context),
              width: screenWidthSize(200, context),
            ),
            Text(
              'dotGmail',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
