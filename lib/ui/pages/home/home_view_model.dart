import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 데이터 로딩 상태 변경
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // 초기 데이터 로드
  Future<void> loadInitialData() async {
    setLoading(true);
    try {
      // TODO: 여기에 실제 데이터 로딩 로직 구현
      await Future.delayed(const Duration(seconds: 2)); // 임시 딜레이
    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      setLoading(false);
    }
  }
}
