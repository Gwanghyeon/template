import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_v1/src/service/theme_service.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator(
      {super.key, required this.child, required this.isBusy});

  final Widget child;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Consumer(builder: (context, ref, child) {
          return IgnorePointer(
            // 자식 위젯이 이벤트를 받지 않도록 동작
            ignoring: !isBusy,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isBusy ? 1 : 0,
              child: Container(
                color: ref.watch(themeServiceProvider).color.background,
                // 부모 위젯을 가득 채우면서 자식 위젯을 중앙에 위치하도록 함
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ref.watch(themeServiceProvider).color.primary,
                  // null: 애니메이션 동작, 0: 에니메이션 없음
                  value: isBusy ? null : 0,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
