import 'dart:math';

import 'package:dotgmail/constants/appConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DotTrickScreen extends StatefulWidget {
  @override
  _DotTrickScreenState createState() => _DotTrickScreenState();
}

class _DotTrickScreenState extends State<DotTrickScreen> {
  var _dotScaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _txtController = TextEditingController();
  bool _genBtn = false;
  int _totEmails = 0;
  String _rndEmail = "";
  List _newEmails = [];

  String genEmails(String email) {
    int a, com = email.length - 1;
    var newname = [];
    var tmp = "";
    var nik = [];

    //Number to Binary
    for (int n = 0; n < pow(2, com); n++) {
      var s = n.toRadixString(2);
      if (s.length < com) {
        var t = "";
        for (int a = 0; a < com - s.length; a++) {
          t += "0";
        }
        t += s;
        s = t;
      }
      nik.add(s);
    }

    for (int x = 0; x < pow(2, com); x++) {
      for (a = 0; a < com; a++) {
        tmp += email[a];
        if (nik[x][a] == "1") {
          tmp += ".";
        }
      }
      tmp += email[a];
      newname.add(tmp + "@gmail.com");
      tmp = "";
    }
    _newEmails = newname;
    return newname[Random().nextInt(newname.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _dotScaffoldKey,
      appBar: screenAppBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              TextField(
                autofocus: true,
                controller: _txtController,
                cursorColor: Colors.red,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Email Address Here',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
                ),
                maxLines: 1,
                onSubmitted: (text) {
                  Pattern email = r'(\W|^)[\w.+\-]*@gmail\.com';
                  RegExp regex = RegExp(email);
                  if (regex.hasMatch(text)) {
                    setState(() {
                      _genBtn = true;
                    });
                  } else {
                    setState(() {
                      _genBtn = false;
                    });
                    _dotScaffoldKey.currentState.showSnackBar(mySnackBar(context, 'Enter Valid Email Address'));
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              MyButton(
                text: 'Generate',
                onPressed: _genBtn
                    ? () {
                        setState(() {
                          var tmp = _txtController.text.replaceAll('@gmail.com', '');
                          tmp = tmp.replaceAll('.', '');
                          _totEmails = pow(2, tmp.length);
                          _rndEmail = genEmails(tmp);
                        });
                      }
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              _genBtn
                  ? _totEmails > 0
                      ? Text(
                          'Total ' + _totEmails.toString() + ' Unique Email Generated',
                          style: TextStyle(fontSize: 16.0),
                        )
                      : Text('')
                  : Text(''),
              SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //   child: Text(
              //     _rndEmail,
              //     style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),
              //   ),
              //   onTap: () async {
              //     Clipboard.setData(ClipboardData(text: _rndEmail));
              //     _dotScaffoldKey.currentState.showSnackBar(mySnackBar(context, 'Email Address Copied'));
              //   },
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              Flexible(
                child: ListView.builder(
                    itemCount: _newEmails.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return GestureDetector(
                        child: Text(
                          _newEmails[index],
                          style: TextStyle(fontSize: 18.0, color: Theme.of(context).primaryColor),
                        ),
                        onTap: () async {
                          Clipboard.setData(ClipboardData(text: _newEmails[index]));
                          _dotScaffoldKey.currentState.showSnackBar(mySnackBar(context, _newEmails[index] + ' Copied'));
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
