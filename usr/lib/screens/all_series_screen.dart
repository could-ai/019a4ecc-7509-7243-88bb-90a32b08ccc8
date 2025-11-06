import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/comic_model.dart';
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
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+3',
        genre: 'Romance',
        rating: 4.2,
        status: 'Completed',
        chapterCount: 250,
        type: 'Manhua',
        isNew: false,
        isUpdated: false,
        title: 'Martial Peak',
        updatedAt: DateTime.now().subtract(const Duration(days: 30)),
        createdAt: DateTime.now().subtract(const Duration(days: 300)),
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
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+7',
        genre: 'Horror',
        rating: 4.3,
        status: 'Completed',
        chapterCount: 90,
        type: 'Manga',
        isNew: false,
        isUpdated: false,
        title: 'Tokyo Ghoul',
        updatedAt: DateTime.now().subtract(const Duration(days: 150)),
        createdAt: DateTime.now().subtract(const Duration(days: 1000)),
      ),
      Comic(
        coverUrl: 'https://via.placeholder.com/200x300.png?text=Comic+8',
        genre: 'Slice of Life',
        rating: 4.6,
        status: 'Ongoing',
        chapterCount: 45,
        type: 'Manhwa',
        isNew: true,
        isUpdated: false,
        title: 'True Beauty',
        updatedAt: DateTime.now().subtract(const Duration(hours: 23)),
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
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
