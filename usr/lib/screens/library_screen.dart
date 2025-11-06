import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';
import 'package:couldai_user_app/widgets/comic_card.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for library
    final List<Comic> historyComics = [
      Comic(
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+2',
        genre: 'Fantasy',
        rating: 4.8,
        status: 'Ongoing',
        chapterCount: 85,
        type: 'Manga',
        isNew: false,
        isUpdated: true,
        title: 'Solo Leveling',
        updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
        createdAt: DateTime.now().subtract(const Duration(days: 100)),
      ),
      Comic(
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+4',
        genre: 'Adventure',
        rating: 4.9,
        status: 'Ongoing',
        chapterCount: 1054,
        type: 'Manga',
        isNew: false,
        isUpdated: true,
        title: 'One Piece',
        updatedAt: DateTime.now().subtract(const Duration(hours: 20)),
        createdAt: DateTime.now().subtract(const Duration(days: 5000)),
      ),
    ];

    final List<Comic> bookmarkedComics = [
       Comic(
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+1',
        genre: 'Action',
        rating: 4.5,
        status: 'Ongoing',
        chapterCount: 120,
        type: 'Manhwa',
        isNew: true,
        isUpdated: false,
        title: 'The Beginning After The End',
        updatedAt: DateTime.now().subtract(const Duration(hours: 10)),
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
       Comic(
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+6',
        genre: 'Comedy',
        rating: 4.7,
        status: 'Ongoing',
        chapterCount: 30,
        type: 'Manga',
        isNew: true,
        isUpdated: true,
        title: 'Spy x Family',
        updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
        createdAt: DateTime.now().subtract(const Duration(days: 6)),
      ),
       Comic(
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+5',
        genre: 'Sci-Fi',
        rating: 4.0,
        status: 'Hiatus',
        chapterCount: 50,
        type: 'Manhwa',
        isNew: false,
        isUpdated: false,
        title: 'Tower of God',
        updatedAt: DateTime.now().subtract(const Duration(days: 90)),
        createdAt: DateTime.now().subtract(const Duration(days: 400)),
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'History'),
                  Tab(text: 'Bookmark'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildComicGrid(historyComics),
            _buildComicGrid(bookmarkedComics),
          ],
        ),
      ),
    );
  }

  Widget _buildComicGrid(List<Comic> comics) {
    if (comics.isEmpty) {
      return const Center(
        child: Text(
          'No comics here.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: comics.length,
        itemBuilder: (context, index) {
          return ComicCard(comic: comics[index]);
        },
      ),
    );
  }
}
