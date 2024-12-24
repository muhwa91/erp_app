import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // HTTP 요청 처리를 위한 라이브러리
import 'package:flutter/services.dart'; // 디버깅
import '../views/dashboard.dart';

class LoginController {
  String id = '';
  String password = '';

  // 로그인 처리 로직
  Future<bool> login(BuildContext context) async {
    if (id.isEmpty || password.isEmpty) {
      showMessage(context, '아이디와 비밀번호를 입력해주세요.');
      return false;
    }

    // try {
    //   // 서버로 로그인 요청 보내기 (예제 API URL)
    //   final response = await Dio().post(
    //     'http://your-php-server.com/api/login.php', // PHP 로그인 API 경로
    //     data: {
    //       'id': id,
    //       'password': password,
    //     },
    //   );

    //   // 서버 응답 확인
    //   if (response.statusCode == 200 && response.data['success'] == true) {
    //     return true; // 로그인 성공
    //   } else {
    //     return false; // 로그인 실패
    //   }
    // } catch (e) {
    //   // 네트워크 또는 서버 오류 처리
    //   showMessage(context, '서버와의 통신에 실패했습니다.');
    //   return false;
    // }
    // 서버 통신 없이 대시보드로 이동
    navigateToDashboard(context);
    return true;
  }

  // 메시지 표시 (스낵바)
  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // 디버깅
  // void exit() {
  //   // SystemNavigator.pop()을 사용하여 앱을 종료
  //   SystemNavigator.pop();
  // }

  // 대시보드 화면으로 네비게이션
  void navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }
}
