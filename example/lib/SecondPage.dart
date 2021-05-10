import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boot/BasePage.dart';

class SecondPage extends BasePage{

  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }

}

class _SecondPage extends BaseState<SecondPage>{

  @override
  Widget buildImpl(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body:Text("test:${args["key"]}")
    );
  }
}