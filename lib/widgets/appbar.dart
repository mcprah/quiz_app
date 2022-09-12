import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/theme.dart';

class MyAppBar extends StatelessWidget {
  final String? title;
  final Color? appbarBackgroundColor;
  final bool? hasBackLeadingButton;
  final bool? hasCancelActionButton;
  final bool? largeTitleSize;
  final bool? appbarIsLight;
  final bool? hasMoreMenus;
  final Widget? appbarLeading;
  final Widget? appbarActions;
  final FontWeight? titleFontWeight;

  const MyAppBar({
    Key? key,
    this.title,
    this.appbarBackgroundColor,
    this.hasBackLeadingButton,
    this.hasCancelActionButton,
    this.appbarLeading,
    this.appbarActions,
    this.hasMoreMenus,
    this.largeTitleSize,
    this.appbarIsLight,
    this.titleFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = title ?? "";
    bool _hasMoreMenus = hasMoreMenus ?? false;
    bool _hasBackLeadingButton = hasBackLeadingButton ?? false;
    bool _hasCancelActionButton = hasCancelActionButton ?? false;
    bool _largeTitleSize = largeTitleSize ?? false;
    bool _appbarIsLight = appbarIsLight ?? true;
    FontWeight _titleFontWeight = titleFontWeight ?? FontWeight.normal;

    return AppBar(
      // toolbarHeight: 90,
      leading: Visibility(
        visible: _hasBackLeadingButton,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            splashRadius: 24,
            icon: Icon(
              Icons.arrow_back,
              color: _appbarIsLight
                  ? ThemeColors.appDarkColor
                  : ThemeColors.appWhiteColor,
            ),
            onPressed: () {
                Navigator.pop(context);
            },
          ),
        ),
      ),
      actions: [
        if (_hasCancelActionButton)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              splashRadius: 24,
              icon: Icon(
                Icons.close,
                color: _appbarIsLight
                    ? ThemeColors.appDarkColor
                    : ThemeColors.appWhiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        if (_hasMoreMenus)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              splashRadius: 24,
              icon: Icon(
                Icons.more_vert,
                color: _appbarIsLight
                    ? ThemeColors.appDarkColor
                    : ThemeColors.appWhiteColor,
              ),
              onPressed: () {},
            ),
          )
      ],
      title: Text(
        _title,
        style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      elevation: 0,
      backgroundColor: appbarBackgroundColor ?? ThemeColors.appLightBgColor,
      titleTextStyle: TextStyle(
        color: _appbarIsLight
            ? ThemeColors.appDarkColor
            : ThemeColors.appWhiteColor,
        fontSize: _largeTitleSize ? 24.0 : 16.0,
        fontWeight: _titleFontWeight,
      ),
    );
  }
}
