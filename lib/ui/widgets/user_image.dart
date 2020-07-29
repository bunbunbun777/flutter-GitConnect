import 'package:flutter/material.dart';
import 'package:flutter_github_connect/helper/GIcons.dart';
import 'package:flutter_github_connect/ui/widgets/cached_image.dart';
import 'package:flutter_github_connect/ui/widgets/custom_text.dart';
import "package:build_context/build_context.dart";
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key key,
    this.imagePath,
    this.name,
    this.subtitle,
    this.variant = TypographyVariant.body,
    this.height = 20,
    this.subVarient = TypographyVariant.body, this.titleStyle, this.subTitleStyle,
  }) : super(key: key);
  final String imagePath;
  final String name, subtitle;
  final TypographyVariant variant, subVarient;
  final double height;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        children: <Widget>[
          imagePath == null ? Icon(GIcons.github)
          : ClipRRect(
            borderRadius: BorderRadius.circular(height / 4),
            child: customNetworkImage(imagePath, placeholder: Icon(GIcons.github)),
          ),
          SizedBox(width: name == null && subtitle == null ? 0 : height/4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              name == null ? SizedBox.shrink() : SizedBox(width: 10),
              name == null
                  ? SizedBox.shrink()
                  : Text(
                      name,
                      style:titleStyle ?? context.textTheme.bodyText1
                    ),
              subtitle == null ? SizedBox.shrink() : name == null
                  ? SizedBox.shrink() : SizedBox(height: 10),
              subtitle == null
                  ? SizedBox.shrink()
                  : Text(
                      subtitle,
                      style:titleStyle ?? context.textTheme.subtitle2
                    ),
            ],
          ),
        ],
      ),
    );
  }
}