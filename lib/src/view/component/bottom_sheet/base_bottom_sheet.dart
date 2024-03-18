import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_v1/src/service/theme_service.dart';

/// 화면 위에 뛰우는 위젯의 경우 주의 사항
/// 자식이 아닌 형제관계로 주입되기에 Provider Scope 주의
/// hot-reload 사용 원할 시 별도의 위젯으로 분리 : SettingBottomSheet->BaseBottomSheet
/// SettingBottomSheet class의 build 함수에서 BaseBottomSheet Call
/// Build 재호출 가능
/// Button->flatType button
class BaseBottomSheet extends ConsumerWidget {
  const BaseBottomSheet({
    required this.child,
    this.padding,
    this.isRoundAll,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;
  final bool? isRoundAll;

  @override
  Widget build(context, ref) {
    final currentTheme = ref.watch(themeServiceProvider);

    return Container(
      decoration: BoxDecoration(
        color: currentTheme.color.surface,
        borderRadius: isRoundAll ?? false
            ? BorderRadius.circular(24)
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
        boxShadow: currentTheme.deco.shadow,
      ),
      padding: padding ??
          const EdgeInsets.only(
            top: 32,
            bottom: 16,
          ),
      // 글씨가 잘리는 것을 방지하기 위한 SafeArea
      // 화면 위나 밑에서 사용하는 위젯의 경우 사용 권장
      child: SafeArea(child: child),
    );
  }
}
