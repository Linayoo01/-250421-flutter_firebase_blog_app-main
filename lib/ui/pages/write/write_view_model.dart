import 'package:flutter/material.dart';

class WriteViewModel extends ChangeNotifier {
  WriteViewModel() {
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  late final TextEditingController titleController;
  late final TextEditingController contentController;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _validateInputs() {
    final title = titleController.text.trim();
    final content = contentController.text.trim();
    return title.isNotEmpty && content.isNotEmpty;
  }

  Future<void> onSubmit(BuildContext context) async {
    if (!_validateInputs()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('제목과 내용을 모두 입력해주세요.')));
      return;
    }

    setLoading(true);
    try {
      // TODO: Firebase에 게시글 데이터 저장
      await Future.delayed(const Duration(seconds: 1)); // 임시 딜레이

      // 저장 성공 후 이전 페이지로 이동
      if (context.mounted) {
        Navigator.pop(context, true); // true는 게시글 작성 성공을 의미
      }
    } catch (e) {
      debugPrint('Error creating post: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('게시글 작성에 실패했습니다.')));
      }
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
