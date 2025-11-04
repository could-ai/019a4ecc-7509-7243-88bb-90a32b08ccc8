import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;

  const ComicCard({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    // Logic to determine if the "NEW" or "UPDATE" badge should be shown
    final bool showNewBadge = DateTime.now().difference(comic.createdAt).inDays < 7;
    final bool showUpdateBadge = DateTime.now().difference(comic.updatedAt).inHours < 24;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(comic.coverUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (showNewBadge || showUpdateBadge)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showNewBadge) _buildBadge('NEW', Colors.green),
                        if (showUpdateBadge) _buildBadge('UPDATE', Colors.orange),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comic.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(comic.genre, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        Text(comic.rating.toString(), style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                 const SizedBox(height: 4),
                 Text('${comic.chapterCount} Chapters', style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
