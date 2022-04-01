
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boot/BasePage.dart';

class RouteManager{
  factory RouteManager() => _getInstance();

  static RouteManager get instance => _getInstance();

  static RouteManager _instance;

  RouteManager._internal(){

  }

  static RouteManager _getInstance(){
    if(_instance == null){
      _instance = new RouteManager._internal();
    }
    return _instance;
  }

  Map<String, BasePage> routes = Map();

  void registerRoute(String route, BasePage page){
    routes[route] = page;
  }

  RouteFactory getRouteFactory(){
    return getRoute;
  }

  MaterialPageRoute getRoute(RouteSettings settings){
    if(routes.containsKey(settings.name)){
      return MaterialPageRoute(builder: (BuildContext context) {
        return routes[settings.name];
      }, settings: settings);
    }
    else{
      return MaterialPageRoute(builder: (BuildContext context) {
        return PageNotFount();
      });
    }
  }

  BasePage getPage(String name){
    if(routes.containsKey(name)) {
      return routes[name];
    }
    else{
      return PageNotFount();
    }
  }
}

class PageNotFount extends BasePage{

  @override
  State<StatefulWidget> createState() {
    return _PageNotFount();
  }

}

class _PageNotFount extends BaseState<PageNotFount>{

  @override
  Widget buildImpl(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("error: page not found"),
      ),
    );
  }
}