import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatefulWidget {
  final String text;
  final Function() presentDatePicker;
  const AdaptiveFlatButton(this.text, this.presentDatePicker, {super.key});

  @override
  State<AdaptiveFlatButton> createState() => _AdaptiveFlatButtonState();
}

class _AdaptiveFlatButtonState extends State<AdaptiveFlatButton> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child:  Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () => widget.presentDatePicker(),
          )
        : TextButton(
            onPressed: () => widget.presentDatePicker(),
            child:  Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
