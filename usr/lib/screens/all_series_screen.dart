import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';
import 'package:couldai_user_app/models/chapter_model.dart';
import 'package:couldai_user_app/widgets/comic_card.dart';

class AllSeriesScreen extends StatefulWidget {
  const AllSeriesScreen({super.key});

  @override
  State<AllSeriesScreen> createState() => _AllSeriesScreenState();
}

class _AllSeriesScreenState extends State<AllSeriesScreen> {
  // Mock data for comics - in a real app, this would come from a database
  final List<Comic> allComics = [
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
      title: 'Martial Peak',
      coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+3',
      author: 'Momo',
      description: 'A young man cultivates in a martial world.',
      genre: 'Romance',
      rating: 4.2,
      status: 'Completed',
      chapterCount: 250,
      type: 'Manhua',
      isNew: false,
      isUpdated: false,
      createdAt: DateTime.now().subtract(const Duration(days: 300)),
      updatedAt: DateTime.now().subtract(const Duration(days: 30)),
      chapters: [
        Chapter(
          title: 'Chapter 1',
          releaseDate: DateTime.now().subtract(const Duration(days: 250)),
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
      title: 'Tokyo Ghoul',
      coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+7',
      author: 'Sui Ishida',
      description: 'A college student becomes a ghoul after an accident.',
      genre: 'Horror',
      rating: 4.3,
      status: 'Completed',
      chapterCount: 90,
      type: 'Manga',
      isNew: false,
      isUpdated: false,
      createdAt: DateTime.now().subtract(const Duration(days: 1000)),
      updatedAt: DateTime.now().subtract(const Duration(days: 150)),
      chapters: [
        Chapter(
          title: 'Chapter 1',
          releaseDate: DateTime.now().subtract(const Duration(days: 950)),
          pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
        ),
      ],
    ),
    Comic(
      title: 'True Beauty',
      coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+8',
      author: 'Yaongi',
      description: 'A story about beauty and self-confidence.',
      genre: 'Slice of Life',
      rating: 4.6,
      status: 'Ongoing',
      chapterCount: 45,
      type: 'Manhwa',
      isNew: true,
      isUpdated: false,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 23)),
      chapters: [
        Chapter(
          title: 'Chapter 1',
          releaseDate: DateTime.now().subtract(const Duration(days: 4)),
          pageUrls: ['https://via.placeholder.com/600x900.png?text=Page+1'],
        ),
      ],
    ),
  ];

  String _selectedGenre = 'All';
  final List<String> _genres = ['All', 'Action', 'Fantasy', 'Romance', 'Adventure', 'Sci-Fi', 'Comedy', 'Horror'];

  @override
  Widget build(BuildContext context) {
    final filteredComics = _selectedGenre == 'All'
        ? allComics
        : allComics.where((comic) => comic.genre == _selectedGenre).toList();

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: const Text('All Series'),
            floating: true,
            pinned: true,
            snap: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120.0),
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by title...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  // Filter Chips
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: _genres.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ChoiceChip(
                            label: Text(_genres[index]),
                            selected: _selectedGenre == _genres[index],
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedGenre = _genres[index];
                                });
                              }
                            },
                            selectedColor: Colors.blue,
                            labelStyle: TextStyle(
                              color: _selectedGenre == _genres[index] ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: filteredComics.length,
          itemBuilder: (context, index) {
            return ComicCard(comic: filteredComics[index]);
          },
        ),
      ),
    );
  }
}
