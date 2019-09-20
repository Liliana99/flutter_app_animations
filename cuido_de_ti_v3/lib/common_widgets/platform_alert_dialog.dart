import 'dart:io';

import 'package:cuido_de_ti_v3/common_widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class PlatformExceptionAlertDialog extends PlatformWidget {
  PlatformExceptionAlertDialog({
    @required this.content,
    @required this.title,
    this.cancelActionText,
    @required this.defaultActionText}): assert(title !=null), assert(content !=null), assert(defaultActionText !=null);
  final String title;
  final String content;
  final String cancelActionText;
  final String defaultActionText;

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS ? 
      await showCupertinoDialog<bool>(
        context: context, 
        builder: (context)=>this) :
        await showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder:(context)=>this,
      );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
       title: Text(title),
      content: Text(content),
      actions: _buildActions (context)
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
   return AlertDialog(
     title: Text(title),
     content: Text(content),
     actions: _buildActions (context),
   );
  }

  List<Widget> _buildActions (BuildContext context){
    final actions = <Widget>[];
    if(cancelActionText!=null){
      actions.add(PlatFormAlertDialogAction(
          child: Text(cancelActionText),
        onPressed: ()=>Navigator.of(context).pop(false),
      ),
     );
    }
    actions.add(
      PlatFormAlertDialogAction(
          child: Text(defaultActionText),
        onPressed: ()=>Navigator.of(context).pop(true),
      ),
    );
    return actions;
  }
}

class PlatFormAlertDialogAction extends PlatformWidget {
  PlatFormAlertDialogAction({this.child,this.onPressed});
  final Widget child;
  final VoidCallback onPressed;


  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}