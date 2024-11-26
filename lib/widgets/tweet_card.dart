import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  final String username;
  final String handle;
  final String tweetText;
  final String time;
  final IconData profilePic;
  final int likes;
  final int comments;
  final int retweets;

  const TweetCard({
    super.key,
    required this.username,
    required this.handle,
    required this.tweetText,
    required this.time,
    required this.profilePic,
    required this.likes,
    required this.comments,
    required this.retweets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Añadir márgenes
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado con Avatar, username y handle
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Icon(profilePic, size: 20),
              ),
              const SizedBox(width: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('$handle · $time', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Texto del tweet
          Text(tweetText),

          const SizedBox(height: 8),

          // Botones de interacción (comentarios, retweets, likes, etc.)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: const Icon(Icons.comment, size: 20), onPressed: () {}),
              IconButton(icon: const Icon(Icons.repeat, size: 20), onPressed: () {}),
              IconButton(icon: const Icon(Icons.favorite_border, size: 20), onPressed: () {}),
              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border, size: 20)),
              IconButton(icon: const Icon(Icons.share, size: 20), onPressed: () {}),
            ],
          ),
          const Divider(
            thickness: 1,

          ),
        ],
      ),
    );
  }
}
