import 'package:flutter/material.dart'; // Flutter 기본 위젯 라이브러리
import '../controllers/loginController.dart'; // 로그인 로직을 처리하는 컨트롤러 클래스

// 로그인 화면을 정의하는 StatelessWidget 클래스
class Login extends StatelessWidget {
  // loginController: 로그인 로직을 처리하기 위한 컨트롤러 인스턴스
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: Flutter에서 화면의 기본 구조를 제공 (앱바, 본문, 플로팅 버튼 등 포함 가능)

      // body: 화면의 주요 내용이 들어가는 영역
      body: Center(
        // Center: 자식 위젯을 화면 중앙에 배치
        child: SingleChildScrollView(
          // SingleChildScrollView: 화면 크기를 초과할 경우 스크롤 가능하도록 설정
          child: Padding(
            // Padding: 모든 방향에 여백(패딩)을 추가
            padding: const EdgeInsets.all(16.0), // 16px 패딩 추가
            child: Column(
              // Column: 위젯들을 세로로 나열하는 레이아웃
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // 자식 위젯을 가로 방향으로 꽉 채움
              children: [
                // 아이디 입력 필드
                TextField(
                  onChanged: (value) {
                    loginController.id = value; // 입력값을 컨트롤러 변수에 저장
                  },
                  decoration: InputDecoration(
                    labelText: '아이디',
                    hintText: '아이디를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16), // TextField와 다음 위젯 사이의 간격 (16px)

                // 비밀번호 입력 필드
                TextField(
                  onChanged: (value) {
                    loginController.password = value; // 입력값을 컨트롤러 변수에 저장
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    hintText: '비밀번호를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 24), // 비밀번호 필드와 버튼 사이의 간격 (24px)

                // 로그인 버튼
                ElevatedButton(
                  onPressed: () async {
                    // 로그인 버튼 클릭 시 컨트롤러에 로그인 요청
                    bool success = await loginController.login(context);
                    if (success) {
                      // 성공 처리
                      loginController.showMessage(context, '로그인 성공!');
                    } else {
                      // 실패 처리
                      loginController.showMessage(context, '로그인 실패!');
                    }
                  },
                  child: Text('로그인'), // 버튼에 표시되는 텍스트
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
