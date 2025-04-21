# flutter create flutter_firebase_blog_app 💡

Flutter와 Firebase를 연동하여 블로그 앱을 만드는 실습 프로젝트입니다.  
MVVM 아키텍처를 적용하고, 글쓰기/수정 UI와 Firestore, Storage 사용을 준비합니다.  
또한 `TextFormField`, `Form`, `GestureDetector`, `ListView`, `Stack` 등 다양한 위젯의 활용법도 익힙니다.

---

## 📁 폴더 구조

```
lib/
├── data/
│   ├── model/
│   └── repository/
├── ui/
│   ├── pages/
│   │   ├── home/
│   │   │   ├── widgets/
│   │   │   ├── home_page.dart
│   │   │   └── home_view_model.dart
│   │   ├── detail/
│   │   │   ├── widgets/
│   │   │   ├── detail_page.dart
│   │   │   └── detail_view_model.dart
│   │   ├── write/
│   │   │   ├── widgets/
│   │   │   ├── write_page.dart
│   │   │   └── write_view_model.dart
│   └── widgets/
└── main.dart


 ```
 
 

---

## 📸 앱 예시 화면

| HomePage 화면 | DetailPage 화면 | WritePage 화면 |
|---------------|-----------------|----------------|
| ![image](https://github.com/user-attachments/assets/a487f408-d7db-494a-8e45-b554982e95db)| ![image](https://github.com/user-attachments/assets/5d2ae152-02dd-4689-be98-00d3169650b1) | ![image](https://github.com/user-attachments/assets/a700b97c-0689-4653-8ddc-76856296ae2c) |

> 💡아래 설명을 확인해주세요.

---

## ✨ 주요 학습 내용


| 항목            | 설명 |
|-----------------|------|
| MVVM 구조        | View(ViewModel)와 Model 레이어를 분리한 아키텍처 |
| Riverpod 상태관리 | Notifier, Provider 기반의 상태 구독과 반응형 UI 구성 |
| Form 입력 처리    | TextFormField와 GlobalKey를 활용한 유효성 검사 |
| 위젯 활용        | ListView, Stack, GestureDetector, AppBar 재사용 등 |

이 프로젝트를 통해 다음과 같은 역량을 기를 수 있습니다:

- Flutter 앱 구조의 **초기 설계 능력 향상**
- Form 유효성 검사를 통한 **입력 UI 검증**
- `Stack`, `ClipRRect`, `AspectRatio` 등 실무 위젯 구성법 습득
- MVVM 기반 ViewModel 로직 구성 및 확장성 확보

---
#HomePage 구성 – 리스트와 앱바, ListView 기본 UI
- 앱바 제목을 BLOG로 지정하고, 테마에서 공통 폰트를 지정했습니다.
- 리스트는 ListView.separated + Stack을 활용해 이미지와 텍스트를 겹치게 구성했고,
  좌우 레이아웃 분리를 위해 Positioned, AspectRatio, ClipRRect까지 함께 활용했습니다.
- 리스트 항목 클릭 시 DetailPage로 이동하는 네비게이션도 적용!

 ```
appBar: AppBar(title: Text('BLOG')),
HomeListView() // Stack 레이아웃 + Positioned 활용

 ```
---
#DetailPage – 아이콘 재사용과 텍스트 본문 구성
- AppBar 우측에 삭제, 수정 버튼을 button() 함수로 재사용 가능하게 분리
- ListView로 전체 스크롤 가능하게 하고, 이미지 → 본문 → 작성자 → 날짜 순으로 배치
- TextOverflow.ellipsis, SizedBox 등을 사용해 레이아웃 정렬을 다듬었습니다.
 ```
appBar: AppBar(actions: [button(Icons.delete), button(Icons.edit)])
body: ListView(children: [...])

 ```

---
#WritePage – TextFormField와 Form 구조 잡기
- TextEditingController는 총 3개(writer, title, content)로 분리
- Form + GlobalKey<FormState> 구조로 유효성 검사를 통합하고
  formKey.currentState!.validate()로 완료 버튼을 구현했습니다.
- 특히 expands, maxLines: null을 통해 콘텐츠 입력 영역의 레이아웃을 다듬었습니다.
 ```
TextFormField(
  controller: titleController,
  validator: (value) => value!.isEmpty ? '제목을 입력해 주세요' : null,
)

 ```
  
---

## ✍ 정리하며 – 나의 시행착오와 배운 점
🔸 처음에는 UI가 너무 많아 부담스러웠어요  
특히 `Stack`이나 `AspectRatio`처럼 익숙하지 않은 위젯이 많아서 처음에는 구성을 어떻게 해야 할지 막막했습니다.  
또한 `Form`을 사용할 때는 GlobalKey나 validator 구조를 이해하는 데 시간이 걸렸습니다.

🔸 구조를 나눠보니 확실히 명확해졌습니다  
`WritePage`, `DetailPage`, `HomePage`를 각기 나누고, 위젯도 따로 `widgets/` 폴더로 분리하니 UI 관리가 훨씬 쉬워졌습니다.  
또한 AppBar의 공통 스타일을 `ThemeData`로 설정해두니 전역 유지보수가 쉬워졌어요.

---


## 🚀 실행 방법
1. Flutter SDK가 설치되어 있는지 확인하세요  
   👉 [Flutter 설치 안내](https://docs.flutter.dev/get-started/install)

2. 저장소를 클론합니다:

```
git clone https://github.com/your-username/flutter_firebase_blog_app.git cd flutter_firebase_blog_app

 ```
3. 의존성을 설치하고 실행하세요:
```
flutter pub get flutter run
```
   
 ---
## 📸 앱 예시 화면

| HomePage 화면 | DetailPage 화면 | WritePage 화면 |
|---------------|-----------------|----------------|
| ![image](https://github.com/user-attachments/assets/a487f408-d7db-494a-8e45-b554982e95db)| ![image](https://github.com/user-attachments/assets/5d2ae152-02dd-4689-be98-00d3169650b1) | ![image](https://github.com/user-attachments/assets/a700b97c-0689-4653-8ddc-76856296ae2c) |

> 💡아래 설명을 확인해주세요.
> 📌 Firebase 연동은 이후 Part2에서 진행됩니다.  
> 현재는 UI 구현 및 구조 설계에 초점을 두고 있습니다.
 ---

 ## 📚 더 자세한 내용은 블로그에서 확인하세요!
MVVM 구조를 배우며 느낀 점, 시행착오, 구조적 이점 등을 정리한 블로그 포스팅입니다.
앱 아키텍처를 처음 접하는 분들께 추천드려요.

🔗 블로그 포스팅
[👉 Flutter 숙련 - 블로그 앱 만들기 Part 01 (UI 구현)](https://grmeems.tistory.com/entry/Flutter-%EC%88%99%EB%A0%A8-TIL-%EB%B8%94%EB%A1%9C%EA%B7%B8-%EC%95%B1-%EB%A7%8C%EB%93%A4%EA%B8%B0-Firebase-%EC%97%B0%EB%8F%99-MVVM-%EA%B5%AC%EC%A1%B0-UI-%EA%B5%AC%EC%84%B1%EA%B9%8C%EC%A7%80%EC%98%88%EC%8B%9C-%ED%8C%8C%EC%9D%BC-%EC%A0%9C%EA%B3%B5)


 ---

 
 ## 🛠 사용 기술
 
 - VSCode + Dart CLI
 - dart:convert 라이브러리 (jsonEncode, jsonDecode)
- Flutter 3.7
- Dart 3.0
- Riverpod (상태관리)
- TextFormField, Form, Stack 등 실전 위젯
- Cupertino / Material UI
- Git & GitHub

 
 ---
 
 ## 👨‍💻 개발자
 - GitHub: [Linayoo01](https://github.com/Linayoo01)
 - 블로그: [개발일지](https://grmeems.tistory.com/)
 - 블로그: [창업일지](https://happy-lily.tistory.com/)
 - 블로그: [그림일지](https://greems.tistory.com/)
