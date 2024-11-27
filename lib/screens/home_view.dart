// home_view.dart
import 'package:flutter/material.dart';
import '../widgets/tweet_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return TweetCard(
          username: 'User $index',
          handle: '@user$index',
          tweetText: 'This is tweet #$index. for you',
          time: '1h',
          profilePic: Icons.person,
          image: 'https://img.freepik.com/vector-gratis/meme-cuadrado-gato-vibrante-simple_742173-4493.jpg',
          likes: 100 + index,
          comments: 20 + index,
          retweets: 50 + index,
        );
      },
    );
  }
}
