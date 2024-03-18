import 'package:flutter/material.dart';

import '../res/typo.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_typo.dart';

/// Theme Customizing 방법
/// AppTheme Class with customized color, deco, typo and brigtness, themeData
/// up to brightness, color, deco, typo, and themeData changes
/// dark_theme.dart, light_theme.dart에서 구체적인 theme을 선언하여 사용

abstract class AppTheme {
  late final Brightness brightness;
  late final ThemeData themeData;

  // custom theme
  late final AppColor color;
  late final AppDeco deco;
  late final AppTypo typo;
}
