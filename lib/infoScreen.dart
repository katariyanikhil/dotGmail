import 'package:dotgmail/constants/appConstant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar(context),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: Text(
                'This tricks only works for GMAIL accouunts ending with @gmail.com. You can use it to customize your mails accordingly and also use it to create multiple accounts at different website where it is possible. This app is made for educational purpose only.',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Text(
                'If you found this project helpful or you learned something from the app and want to thank me, consider buying me a cup coffee here or if you wanna support me by donation following are some of the ways you can help me so I can make such more apps in future',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  child: Text(
                    'Paypal',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontFamily: 'WorkSans',
                      fontSize: 20,
                    ),
                  ),
                  onTap: () async {
                    await launch(
                      'https://paypal.me/payme3105/',
                      enableJavaScript: true,
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Text(
                    'BuyMeaCoffee',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontFamily: 'WorkSans',
                      fontSize: 20,
                    ),
                  ),
                  onTap: () async {
                    await launch(
                      'https://www.buymeacoffee.com/katariyanikhil',
                      enableJavaScript: true,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
