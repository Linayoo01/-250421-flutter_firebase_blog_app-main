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
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '최근 글',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const HomeListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WritePage(),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
