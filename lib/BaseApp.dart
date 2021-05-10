
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boot/RouteManager.dart';

abstract class BaseApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    registerRoutes();
    return _BaseApp(build);
  }

  Widget build(BuildContext context, Widget page);

  void registerRoutes();

}

class _BaseApp extends State<BaseApp>{

  Function buildImpl;
  static const bootChannel = const BasicMessageChannel<String>("startPage", StringCodec());
  Widget curPage = RouteManager.instance.getPage("");

  _BaseApp(this.buildImpl){
    bootChannel.setMessageHandler((message) async {
      setState(() {
        var json = jsonDecode(message);
        var route = json["route"];
        var page = RouteManager.instance.getPage(route);
        page.args = json["params"];
        curPage = page;
      });
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildImpl.call(context, curPage);
  }

}