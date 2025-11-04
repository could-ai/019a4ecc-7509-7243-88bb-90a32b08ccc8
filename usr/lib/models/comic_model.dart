class Comic {
  final String title;
  final String coverUrl;
  final String genre;
  final double rating;
  final String status;
  final int chapterCount;
  final String type; // manga, manhwa, manhua
  final bool isNew;
  final bool isUpdated;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comic({
    required this.title,
    required this.coverUrl,
    required this.genre,
    required this.rating,
    required this.status,
    required this.chapterCount,
    required this.type,
    required this.isNew,
    required this.isUpdated,
    required this.createdAt,
    required this.updatedAt,
  });
}
