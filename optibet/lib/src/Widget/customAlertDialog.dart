import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/const.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, yes, no;
  final Image img;

  const CustomDialogBox({Key key, this.title, this.descriptions, this.yes, this.no, this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  double padding = 20.0;
  double avatarRadius = 45.0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: padding,top: avatarRadius
              + padding, right: padding,bottom: padding
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 24, color: PRIMARYCOLOR)),
              SizedBox(height: 15,),
              Text(widget.descriptions,style: TextStyle(fontSize: 14),textAlign: TextAlign.center),
              SizedBox(height: 22,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop(true);
                        },
                        child: Text(widget.yes,style: TextStyle(fontSize: 18, color: Colors.red))),
                  ),
                  Align(
                    child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop(false);
                        },
                        child: Text(widget.no,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900))),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: padding,
          right: padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
                child: Image.asset("lib/src/images/loulou.jpg")
            ),
          ),
        ),
      ],
    );
  }
}