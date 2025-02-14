import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextAlign textAlign;
  final TextStyle? style;
  final double? textScaleFactor;
  final EdgeInsets padding;
  final Function()? onTap;
  final TextOverflow overflow;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? splashColor;

  @override
  const TextView(
    this.text, {
    Key? key,
    this.maxLine,
    this.textScaleFactor,
    this.textAlign = TextAlign.start,
    this.padding = EdgeInsets.zero,
    this.overflow = TextOverflow.visible,
    this.onTap,
    this.style,
    this.width,
    this.borderRadius,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: splashColor ?? Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          width: width,
          child: Text(
            text,
            maxLines: maxLine,
            textAlign: textAlign,
            textScaleFactor: textScaleFactor,
            overflow: overflow,
            style: style,
          ),
        ),
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  MyRichText({
    Key? key,
    this.text1 = '',
    this.text2 = '',
    this.text3 = '',
    this.text4 = '',
    this.textAlign = TextAlign.start,
    this.style1,
    this.style2,
    this.style3,
    this.style4,
    this.onTap3,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);
  final String text1, text2, text3, text4;
  final TextStyle? style1, style2, style3, style4;
  final TextAlign textAlign;
  final void Function()? onTap3;
  final EdgeInsets margin;

  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(text: text1, style: style1, children: [
          TextSpan(
            text: text2,
            style: style2,
          ),
          TextSpan(
            text: text3,
            style: style3,
            recognizer: _tapGestureRecognizer..onTap = onTap3,
          ),
          TextSpan(
            text: text4,
            style: style4,
          ),
        ]),
      ),
    );
  }
}
