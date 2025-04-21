import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. 왼쪽 컨텐츠 영역
        Positioned.fill(
          right: 100, // 오른쪽 이미지 공간 확보
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today I Learned',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flutter의 그리드뷰를 배웠습니다. Flutter의 그...',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '2024.8.8 20:30',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[400],
                      ),
                ),
              ],
            ),
          ),
        ),
        // 2. 오른쪽 이미지 영역
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          width: 120,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(16)),
            child: Image.network(
              'https://picsum.photos/200', // 임시 이미지
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
