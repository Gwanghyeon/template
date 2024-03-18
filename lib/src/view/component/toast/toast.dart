// Overlay: 스크린에 상관없이 화면에 적용 -> Toast Message 에 적용

import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'toast_builder.dart';

// * Toast.show
// * Toast 메세지 출력 함수

abstract class Toast {
  static Future<void> show({
    required String text,
    Duration duration = const Duration(seconds: 2),
  }) async {
    // navigatorKey 활용하여 현재 context에 접근
    BuildContext? context = MyApp.navigatorKey.currentContext;
    if (context == null) return; // null: 현재 화면이 그려지지 않은 상태를 의미

    // Insert =============================================
    const animDuration = Duration(milliseconds: 300);

    // 해당 클래스에 접근하는 키 선언
    // toastKey.currentState?.isShow의 형태로 접근 가능
    final toastKey = GlobalKey<ToastBuilderState>();

    final toast = OverlayEntry(
      builder: (context) => ToastBuilder(
        key: toastKey,
        text: text,
        animDuration: animDuration,
      ),
    );
    Overlay.of(context).insert(toast);

    // 한 프레임 이후에 해당 콜백 함수를 진행
    // toast가 인젝션 된 이후에 해당 상태값(isShow)에 접근하기 위함
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      toastKey.currentState?.isShow = true;
    });
    // ====================================================

    // Remove
    // 해당 시간만큼의 딜레이 후 제거
    //* 애니메이션 재생 시간도 여기에 포함됨
    await Future.delayed(duration);
    toastKey.currentState?.isShow = false;

    //* 1에서 0으로 바뀌는 동안의 에니메이션 재생 기간 만큼 기다렸다가 메세지 제거
    await Future.delayed(animDuration);
    toast.remove();
  }
}
