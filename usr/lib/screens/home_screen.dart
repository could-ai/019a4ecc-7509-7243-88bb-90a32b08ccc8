import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:couldai_user_app/models/comic_model.dart';
import 'package:couldai_user_app/widgets/comic_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for comics
    final List<Comic> comics = [
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
    ];

    final List<String> bannerImages = [
      'https://via.placeholder.com/600x300.png?text=Banner+1',
      'https://via.placeholder.com/600x300.png?text=Banner+2',
      'https://via.placeholder.com/600x300.png?text=Banner+3',
    ];

    final List<String> announcements = [
      'Server maintenance tonight at 12 AM.',
      'New series "The Grand Mage" is out!',
      'Premium accounts get 50% off for a limited time.',
    ];

    final List<Map<String, String>> projectUpdates = [
      {'title': 'Chapter Scraper Update', 'date': '2024-07-21', 'content': 'Improved scraper for faster chapter updates.'},
      {'title': 'New Comment Feature', 'date': '2024-07-20', 'content': 'You can now reply to comments!'},
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Carousel Banner
          cs.CarouselSlider(
            options: cs.CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
            ),
            items: bannerImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // 2. Announcement Slider
          _buildSectionTitle('Announcements'),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(child: Text(announcements[index], style: const TextStyle(color: Colors.blue),)),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // 3. Project Update Section
          _buildSectionTitle('Project Updates'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: projectUpdates.map((update) => Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(update['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(update['content']!),
                  trailing: Text(update['date']!),
                ),
              )).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // 4. Comic Card Grid
          _buildSectionTitle('Popular Comics'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust for responsiveness later
                childAspectRatio: 0.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: comics.length,
              itemBuilder: (context, index) {
                return ComicCard(comic: comics[index]);
              },
            ),
          ),
           const SizedBox(height: 20),
           const Center(child: Text('© 2025 CozyCanz')),
           const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
