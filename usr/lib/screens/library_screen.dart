import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';
import 'package:couldai_user_app/models/chapter_model.dart';
import 'package:couldai_user_app/widgets/comic_card.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for library
    final List<Comic> historyComics = [
      Comic(
        title: 'Solo Leveling',
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+2',
        author: 'Chu-Gong',
        description: 'A weak hunter becomes the strongest.',
        genre: 'Fantasy',
        rating: 4.8,
        status: 'Ongoing',
        chapterCount: 85,
        type: 'Manga',
        isNew: false,
        isUpdated: true,
        createdAt: DateTime.now().subtract(const Duration(days: 100)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
        chapters: [
          Chapter(
            title: 'Chapter 1',
            releaseDate: DateTime.now().subtract(const Duration(days: 80)),
            pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
          ),
        ],
      ),
      Comic(
        title: 'One Piece',
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+4',
        author: 'Eiichiro Oda',
        description: 'Pirates searching for the ultimate treasure.',
        genre: 'Adventure',
        rating: 4.9,
        status: 'Ongoing',
        chapterCount: 1054,
        type: 'Manga',
        isNew: false,
        isUpdated: true,
        createdAt: DateTime.now().subtract(const Duration(days: 5000)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 20)),
        chapters: [
          Chapter(
            title: 'Chapter 1',
            releaseDate: DateTime.now().subtract(const Duration(days: 4900)),
            pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
          ),
        ],
      ),
    ];

    final List<Comic> bookmarkedComics = [
      Comic(
        title: 'The Beginning After The End',
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+1',
        author: 'TurtleMe',
        description: 'A story about a king reincarnated into a fantasy world.',
        genre: 'Action',
        rating: 4.5,
        status: 'Ongoing',
        chapterCount: 120,
        type: 'Manhwa',
        isNew: true,
        isUpdated: false,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 10)),
        chapters: [
          Chapter(
            title: 'Chapter 1',
            releaseDate: DateTime.now().subtract(const Duration(days: 100)),
            pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
          ),
        ],
      ),
      Comic(
        title: 'Spy x Family',
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+6',
        author: 'Tatsuya Endo',
        description: 'A spy, assassin, and telepath form a fake family.',
        genre: 'Comedy',
        rating: 4.7,
        status: 'Ongoing',
        chapterCount: 30,
        type: 'Manga',
        isNew: true,
        isUpdated: true,
        createdAt: DateTime.now().subtract(const Duration(days: 6)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
        chapters: [
          Chapter(
            title: 'Chapter 1',
            releaseDate: DateTime.now().subtract(const Duration(days: 5)),
            pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
          ),
        ],
      ),
      Comic(
        title: 'Tower of God',
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+5',
        author: 'SIU',
        description: 'Climbing the Tower to reunite with a loved one.',
        genre: 'Sci-Fi',
        rating: 4.0,
        status: 'Hiatus',
        chapterCount: 50,
        type: 'Manhwa',
        isNew: false,
        isUpdated: false,
        createdAt: DateTime.now().subtract(const Duration(days: 400)),
        updatedAt: DateTime.now().subtract(const Duration(days: 90)),
        chapters: [
          Chapter(
            title: 'Chapter 1',
            releaseDate: DateTime.now().subtract(const Duration(days: 350)),
            pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
          ),
        ],
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
