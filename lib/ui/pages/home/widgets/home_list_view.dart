import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/ui/pages/detail/detail_page.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 50,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return item();
        },
      ),
    );
  }

  Widget item() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPage(postId: 'post123'),
            ),
          );
        },
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                width: 120,
                height: 120,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://picsum.photos/200/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(right: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today I Learned',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Flutter의 그리드뷰를 배웠습니다.Flutter의 그리드뷰를 배웠습니다.Flutter의 그리드뷰를 배웠습니다.Flutter의 그리드뷰를 배웠습니다.Flutter의 그리드뷰를 배웠습니다.',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '2024.9.9 20:80',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
