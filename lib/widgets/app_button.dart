import 'package:flutter/material.dart';
import 'package:test_app/theme.dart';

class AppButton extends StatelessWidget {
  final Color? btnBackgroundColor;
  final void Function() btnOnPressed;
  final bool? hasFixedSize;
  final OutlinedBorder? shape;
  final Size? fixedSize;
  final FontWeight? btnTextFontWeight;
  final Widget child;

  const AppButton({
    Key? key,
    this.btnBackgroundColor,
    this.hasFixedSize,
    this.fixedSize,
    this.shape,
    this.btnTextFontWeight,
    required this.btnOnPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _hasFixedSize = hasFixedSize ?? false;
    final Size _fixedSize = fixedSize ??  const Size(284.0, 58.0);
    final OutlinedBorder _shape = shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        );

    return ElevatedButton(
      onPressed: btnOnPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Center(
          child: child,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: _shape,
        primary: btnBackgroundColor ?? ThemeColors.appPrimaryColor,
        elevation: 0,
        fixedSize: _hasFixedSize
            ? _fixedSize
            : Size(MediaQuery.of(context).size.width, 70.0),
      ),
    );
  }
}
