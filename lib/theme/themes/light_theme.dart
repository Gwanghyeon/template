import 'package:flutter/material.dart';

import '../foundation/app_theme.dart';
import '../res/palette.dart';
import '../res/typo.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    surface: Palette.grey100,
    background: Palette.black.withOpacity(0.55),
    text: Palette.black,
    subtext: Palette.grey700,
    toastContainer: Palette.black.withOpacity(0.85),
    onToastContainer: Palette.grey100,
    hint: Palette.grey300,
    hintContainer: Palette.grey150,
    onHintContainer: Palette.grey500,
    inactive: Palette.grey400,
    inactiveContainer: Palette.grey250,
    onInactiveContainer: Palette.white,
    primary: Palette.green,
    onPrimary: Palette.white,
    secondary: Palette.red,
    onSecondary: Palette.white,
    tertiary: Palette.yellow,
    onTertiary: Palette.white,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const NotoSans(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.1),
        blurRadius: 35,
      ),
    ],
  );

  @override
  late ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: color.surface,
    // BottomSheet의 child 외부 색상이 출력되는 것을 방지하기 위한 세팅
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: color.surface,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: color.text,
      ),
      titleTextStyle: typo.headline2.copyWith(
        color: color.text,
      ),
    ),
  );
}
