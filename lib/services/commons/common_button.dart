import 'package:flutter/material.dart';
import 'package:destini/services/commons/common_spacing.dart';

enum IconDirection { top, bottom, left, right }

class CommonButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double borderRadius;
  final double fontSize;
  final ImageProvider? icon;
  final IconDirection iconDirection;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? verticalPadding;
  final double? horizontalPadding;

  const CommonButton({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.gradient,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.icon,
    this.iconDirection = IconDirection.left,
    this.height,
    this.width,
    this.padding,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final iconWidget = icon != null
        ? Image(
            image: icon!,
            width: 24,
            height: 24,
          )
        : const SizedBox();

    List<Widget> children = [];
    switch (iconDirection) {
      case IconDirection.left:
        children = [iconWidget, if (icon != null) w8, child];
        break;
      case IconDirection.right:
        children = [child, if (icon != null) w8, iconWidget];
        break;
      case IconDirection.top:
        children = [iconWidget, if (icon != null) h4, child];
        break;
      case IconDirection.bottom:
        children = [child, if (icon != null) h4, iconWidget];
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: verticalPadding ?? 12.0,
              horizontal: horizontalPadding ?? 16.0,
            ),
        decoration: BoxDecoration(
          color:
              gradient == null ? backgroundColor ?? theme.primaryColor : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: iconDirection == IconDirection.top ||
                iconDirection == IconDirection.bottom
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
      ),
    );
  }
}






// AI Prompt to Add another functionaliti 👇
/*

**"Add a new property `[???]` to `CommonButton`. Follow these guidelines:** 
- 🛠️ Add sensible padding between the icon and text.  
- ✅ Keep the core structure unchanged.  
- 🎯 Ensure the button remains responsive and well-aligned."  

*/