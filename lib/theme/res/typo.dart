import 'package:flutter/material.dart';

// 폰트 정의: 종류와 크기
abstract class Typo {
  const Typo({
    required this.name,
    required this.light,
    required this.regular,
    required this.semiBold,
  });

  final String name;
  final FontWeight light;
  final FontWeight regular;
  final FontWeight semiBold;
}

// Typo를 상속한 폰트 클래스 생성
// Downloading 'noto_sans' font from GoogleFonts
// asset 폴더에 폰트 저장 후 pubspec.yaml 설정
class NotoSans implements Typo {
  const NotoSans();

  @override
  final String name = 'noto_sans';

  @override
  // NotoSans-Light
  final FontWeight light = FontWeight.w300;

  @override
  // NotoSans-Regular
  final FontWeight regular = FontWeight.w400;

  @override
  // NotoSans-SemiBold
  final FontWeight semiBold = FontWeight.w600;
}
