import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for leaderboards
    final List<Map<String, String>> topUsers = [
      {'rank': '1', 'name': 'Shadow Monarch', 'level': 'SSS', 'avatar': 'https://i.pravatar.cc/150?u=a042581f4e29026704d'},
      {'rank': '2', 'name': 'MightyReader', 'level': 'SS', 'avatar': 'https://i.pravatar.cc/150?u=a042581f4e29026705d'},
      {'rank': '3', 'name': 'ComicFanatic', 'level': 'S', 'avatar': 'https://i.pravatar.cc/150?u=a042581f4e29026706d'},
      {'rank': '4', 'name': 'WebtoonLover', 'level': 'A', 'avatar': 'https://i.pravatar.cc/150?u=a042581f4e29026707d'},
      {'rank': '5', 'name': 'MangaMaster', 'level': 'A', 'avatar': 'https://i.pravatar.cc/150?u=a042581f4e29026708d'},
    ];

    final List<Map<String, String>> topComics = [
      {'rank': '1', 'title': 'Solo Leveling', 'views': '10.5M', 'cover': 'https://via.placeholder.com/100x150.png?text=SL'},
      {'rank': '2', 'title': 'One Piece', 'views': '9.8M', 'cover': 'https://via.placeholder.com/100x150.png?text=OP'},
      {'rank': '3', 'title': 'The Beginning After The End', 'views': '8.2M', 'cover': 'https://via.placeholder.com/100x150.png?text=TBATE'},
      {'rank': '4', 'title': 'Tower of God', 'views': '7.9M', 'cover': 'https://via.placeholder.com/100x150.png?text=TOG'},
      {'rank': '5', 'title': 'Spy x Family', 'views': '7.5M', 'cover': 'https://via.placeholder.com/100x150.png?text=SxF'},
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
                  Tab(text: 'Top Users'),
                  Tab(text: 'Top Comics'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildUserLeaderboard(topUsers),
            _buildComicLeaderboard(topComics),
          ],
        ),
      ),
    );
  }

  Widget _buildUserLeaderboard(List<Map<String, String>> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            leading: Text(
              user['rank']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            title: Text(user['name']!),
            subtitle: Text('Rank: ${user['level']}'),
            trailing: CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']!),
            ),
          ),
        );
      },
    );
  }

  Widget _buildComicLeaderboard(List<Map<String, String>> comics) {
    return ListView.builder(
      itemCount: comics.length,
      itemBuilder: (context, index) {
        final comic = comics[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            leading: Text(
              comic['rank']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            title: Text(comic['title']!),
            subtitle: Text('Views: ${comic['views']}'),
            trailing: Image.network(
              comic['cover']!,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
