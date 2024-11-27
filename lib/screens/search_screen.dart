// search_view.dart
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#TrendingTopic${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text(
              'Short description or details about the trend.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 5),
            const Divider(height: 20, thickness: 1),
          ],
        );
      },
    );
  }
}
