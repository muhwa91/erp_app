import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/themeNotifier.dart';
import './login.dart'; // 로그인 화면으로 돌아가기 위해 임포트

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeNotifier 접근
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ERP 대시보드'),
      ),
      body: Center(
        child: Text(
          '환영합니다! ERP 대시보드입니다.',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '메뉴',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // 홈 메뉴
            ListTile(
              leading: Icon(Icons.home),
              title: Text('홈'),
              onTap: () {
                // 홈 메뉴 클릭 시 동작 (현재 페이지이므로 닫기)
                Navigator.pop(context);
              },
            ),
            // 드롭다운 메뉴 예시: 관리
            ExpansionTile(
              leading: Icon(Icons.manage_accounts),
              title: Text('관리'),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('사용자 관리'),
                  onTap: () {
                    // 사용자 관리 메뉴 클릭 시 동작 (추가 구현 필요)
                    Navigator.pop(context);
                    // 예시로 스낵바 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('사용자 관리 페이지는 아직 구현되지 않았습니다.')),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.inventory),
                  title: Text('재고 관리'),
                  onTap: () {
                    // 재고 관리 메뉴 클릭 시 동작 (추가 구현 필요)
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('재고 관리 페이지는 아직 구현되지 않았습니다.')),
                    );
                  },
                ),
              ],
            ),
            // 테마 토글 스위치
            SwitchListTile(
              title: Text('다크 테마'),
              secondary: Icon(Icons.brightness_6),
              value: themeNotifier.isDarkTheme,
              onChanged: (bool value) {
                themeNotifier.toggleTheme(value); // 테마 토글
              },
            ),
            // 로그아웃 메뉴
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('로그아웃'),
              onTap: () {
                // 로그아웃 시 로그인 화면으로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
