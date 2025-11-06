import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';
import 'package:couldai_user_app/screens/comic_reader_screen.dart';

class ComicDetailScreen extends StatelessWidget {
  final Comic comic;

  const ComicDetailScreen({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                comic.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 10.0, color: Colors.black)],
                ),
              ),
              background: Image.network(
                comic.coverUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(comic.author, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                      const SizedBox(width: 16),
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(comic.rating.toString(), style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      Chip(label: Text(comic.genre)),
                      Chip(label: Text(comic.status)),
                      Chip(label: Text(comic.type)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    comic.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                       if (comic.chapters.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ComicReaderScreen(chapter: comic.chapters.first),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.book),
                    label: const Text('Start Reading'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Chapters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chapter = comic.chapters[index];
                return ListTile(
                  title: Text(chapter.title),
                  subtitle: Text('Released on ${chapter.releaseDate.toLocal().toString().split(' ')[0]}'),
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComicReaderScreen(chapter: chapter),
                      ),
                    );
                  },
                );
              },
              childCount: comic.chapters.length,
            ),
          ),
           SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Comments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Placeholder for comments
                  const Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d')),
                      title: Text('Shadow Monarch'),
                      subtitle: Text('This is a great comic! Can\'t wait for the next chapter.'),
                    ),
                  ),
                   const Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026705d')),
                      title: Text('MightyReader'),
                      subtitle: Text('The art is amazing.'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
