import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/themeNotifier.dart';
import 'views/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeNotifier의 현재 테마 상태를 가져옴
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: themeNotifier.currentTheme,
      home: Login(), // 로그인 화면을 홈으로 설정
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
    );
  }
}
