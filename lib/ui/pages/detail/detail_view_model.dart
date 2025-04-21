import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String title;
  final String content;
  final String author;
  final String createdAt;
  final String userId;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    required this.userId,
  });
}

class DetailViewModel extends ChangeNotifier {
  DetailViewModel({required this.postId}) {
    _loadPost();
  }

  final String postId;
  Post? _post;
  bool _isLoading = false;
  String? _currentUserId; // TODO: 실제 인증된 사용자 ID로 대체

  // Getters
  Post? get post => _post;
  bool get isLoading => _isLoading;
  bool get isMyPost => _post?.userId == _currentUserId;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _loadPost() async {
    setLoading(true);
    try {
      // TODO: Firebase에서 실제 게시글 데이터 로드
      await Future.delayed(const Duration(seconds: 1)); // 임시 딜레이
      _post = Post(
        id: postId,
        title: '샘플 게시글',
        content: '게시글 내용입니다.',
        author: '작성자',
        createdAt: '2024-03-19',
        userId: 'user123',
      );
    } catch (e) {
      debugPrint('Error loading post: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> onEditPost() async {
    // TODO: 게시글 수정 페이지로 이동 로직 구현
  }

  Future<void> onDeletePost() async {
    try {
      setLoading(true);
      // TODO: Firebase에서 게시글 삭제 로직 구현
      await Future.delayed(const Duration(seconds: 1)); // 임시 딜레이
      // TODO: 삭제 후 이전 페이지로 이동
    } catch (e) {
      debugPrint('Error deleting post: $e');
    } finally {
      setLoading(false);
    }
  }
}
