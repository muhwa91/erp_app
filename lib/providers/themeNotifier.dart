import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme = false;

  // 현재 테마 상태를 반환
  bool get isDarkTheme => _isDarkTheme;

  // 현재 테마 데이터를 반환
  ThemeData get currentTheme =>
      _isDarkTheme ? ThemeData.dark() : ThemeData.light();

  // 테마를 토글하는 메서드
  void toggleTheme(bool isOn) {
    _isDarkTheme = isOn;
    notifyListeners(); // 변경 사항을 리스너들에게 알림
  }
}
