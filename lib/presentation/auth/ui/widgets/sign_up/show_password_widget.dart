import 'package:flutter/material.dart';
import 'package:magueyapp/common/widget/text_view.dart';
import 'package:magueyapp/theme/my_colors.dart';
import 'package:magueyapp/theme/text_styling.dart';
import 'package:magueyapp/utils/extensions/media_query.dart';
import 'package:magueyapp/utils/extensions/sized_box.dart';

class ShowPasswordButton extends StatelessWidget {
  final Function(bool?) onTap;
  final bool value;
  final EdgeInsets margin;
  const ShowPasswordButton({
    super.key,
    required this.onTap,
    this.margin = EdgeInsets.zero,
    this.value = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: () => onTap(value),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 14.pxV(context),
              width: 14.pxV(context),
              child: Checkbox(
                value: value,
                splashRadius: 0,
                onChanged: onTap,
                fillColor: MaterialStateProperty.all(
                  value ? MyColors.green658F7B : MyColors.transparent,
                ),
                activeColor: MyColors.green658F7B,
                focusColor: MyColors.green658F7B,
                checkColor: MyColors.white,
                overlayColor: MaterialStateProperty.all(MyColors.green658F7B),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(4.pxV(context)),
                ),
              ),
            ),
            8.hSpace(context),
            TextView(
              "Show password",
              style: myTextStyle.font_12w400.copyWith(
                color: MyColors.green658F7B,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
