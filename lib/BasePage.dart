

import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget{
  dynamic args;
}

abstract class BaseState<T extends BasePage> extends State<T>{
  dynamic args;

  @override
  Widget build(BuildContext context) {
    if(ModalRoute.of(context).settings.arguments == null){
      args = widget.args;
    }
    else{
      args = ModalRoute.of(context).settings.arguments;
    }
    return buildImpl(context);
  }

  Widget buildImpl(BuildContext context);
}