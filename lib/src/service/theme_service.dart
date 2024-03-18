import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../theme/foundation/app_theme.dart';
import '../../theme/themes/themes.dart';

part '../../.generated/src/service/theme_service.g.dart';

@riverpod
class ThemeService extends _$ThemeService {
  @override
  AppTheme build() => LightTheme();

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      state = DarkTheme();
    } else {
      state = LightTheme();
    }
  }
}
