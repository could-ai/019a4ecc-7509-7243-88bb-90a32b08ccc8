import 'package:couldai_user_app/models/chapter_model.dart';

class Comic {
  final String title;
  final String coverUrl;
  final String author;
  final String description;
  final String genre;
  final double rating;
  final String status;
  final int chapterCount;
  final String type; // manga, manhwa, manhua
  final bool isNew;
  final bool isUpdated;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Chapter> chapters;

  Comic({
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.description,
    required this.genre,
    required this.rating,
    required this.status,
    required this.chapterCount,
    required this.type,
    required this.isNew,
    required this.isUpdated,
    required this.createdAt,
    required this.updatedAt,
    required this.chapters,
  });
}
