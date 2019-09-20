
import 'package:cuido_de_ti_v3/common_widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';


class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    double height,
    double borderRadius,
    VoidCallback onPressed,
  }) : assert(text != null),
        super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
          color: color,
          onPressed: onPressed,
        );
}
