import 'package:flutter/material.dart';
import 'package:flutter_firebase_blog_app/ui/pages/home/widgets/home_list_view.dart';
import 'package:flutter_firebase_blog_app/ui/pages/write/write_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLOG'),
      ),
      // 6. Scaffold body 영역의 색상
      backgroundColor: Colors.grey[200],
      // 7. 패딩 적용
      body: Padding(
        padding: const EdgeInsets.all(20),
        // 1. 레이아웃 배치
        child: Column(
          // 5. Expanded를 배치하면 Column의 크기는 정해지기 때문에
          //    CrossAxisAlignment 설정해주기!
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. 텍스트 배치
            const Text(
              '최근 글',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // 3. 리스트뷰 배치
            // ListView는 부모위젯의 크기가 있어야 하므로
            // Column 내에서 사용 시 Expanded 배치!
            // (Column은 디폴트로 크기가 정해지지 않은 위젯!)
            HomeListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const WritePage(post: null);
            },
          ));
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
