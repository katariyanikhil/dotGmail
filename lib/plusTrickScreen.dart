import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/appConstant.dart';

class PlusTrickScreen extends StatefulWidget {
  @override
  _PlusTrickScreenState createState() => _PlusTrickScreenState();
}

class _PlusTrickScreenState extends State<PlusTrickScreen> {
  var _plusScaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _txtController = TextEditingController();
  bool _genBtn = false;
  String _rndEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _plusScaffoldKey,
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
                    _plusScaffoldKey.currentState.showSnackBar(mySnackBar(context, 'Enter Valid Email Address'));
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
                          _rndEmail = tmp + '+' + words[Random().nextInt(4000)] + '@gmail.com';
                          print(tmp);
                        });
                      }
                    : null,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Text(
                  _rndEmail,
                  style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),
                ),
                onTap: () async {
                  Clipboard.setData(ClipboardData(text: _rndEmail));
                  _plusScaffoldKey.currentState.showSnackBar(mySnackBar(context, 'Email Address Copied'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
