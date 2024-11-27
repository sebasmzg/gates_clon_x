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
  final String image;

  const TweetCard({
    super.key,
    required this.username,
    required this.handle,
    required this.tweetText,
    required this.image,
    required this.time,
    required this.profilePic,
    required this.likes,
    required this.comments,
    required this.retweets,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                child: Icon(profilePic, size: 20),
              ),
              const SizedBox(width: 8),
              // Contenido del tweet
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Encabezado con username, handle y more_horiz
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text('$handle · $time', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    // Texto del tweet
                    Text(tweetText),
                    const SizedBox(height: 8),

                    // Imagen del tweet
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        image,
                        width: size.width,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Botones de interacción
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon: const Icon(Icons.comment, size: 20), onPressed: () {}),
                        IconButton(icon: const Icon(Icons.repeat, size: 20), onPressed: () {}),
                        IconButton(icon: const Icon(Icons.favorite_border, size: 20), onPressed: () {}),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border, size: 20)),
                        IconButton(icon: const Icon(Icons.share, size: 20), onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
