import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class IntlHelper {
  // 지원 언어 변수
  static const en = Locale('en');
  static const ko = Locale('ko');

  // 한국어 여부 확인 함수
  static bool get isKo => Intl.getCurrentLocale() == ko.languageCode;

  // 통화 관련 함수
  static String currency({
    required String symbol,
    required int number,
  }) {
    return NumberFormat.currency(
      symbol: symbol,
      // locale 정보가 따로 제공되지 않기에 symbol을 기준으로 구분
      locale: (symbol == '￦' ? ko : en).languageCode,
    ).format(number);
  }
}
