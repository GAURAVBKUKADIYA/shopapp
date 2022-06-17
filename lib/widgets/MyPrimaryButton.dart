
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Resource/StyaleResources.dart';

class MyPrimaryButton extends StatefulWidget {

  GestureTapCallback onclick;

  var buttonText;
  var color ;

  MyPrimaryButton({this.onclick,this.buttonText,this.color});


  @override
  State<MyPrimaryButton> createState() => _MyPrimaryButtonState();
}

class _MyPrimaryButtonState extends State<MyPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onclick,

      child: Container(
        alignment: Alignment.center,
        decoration: new BoxDecoration (
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          color: widget.color
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(widget.buttonText,style: StyaleResources.primaryclickstyletext,),
      ),

    );
  }
}