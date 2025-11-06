import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/chapter_model.dart';

class ComicReaderScreen extends StatefulWidget {
  final Chapter chapter;
  const ComicReaderScreen({super.key, required this.chapter});

  @override
  State<ComicReaderScreen> createState() => _ComicReaderScreenState();
}

class _ComicReaderScreenState extends State<ComicReaderScreen> {
  bool _showUI = true;

  void _toggleUI() {
    setState(() {
      _showUI = !_showUI;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _showUI
          ? AppBar(
              title: Text(widget.chapter.title),
              backgroundColor: Colors.black.withOpacity(0.7),
            )
          : null,
      body: GestureDetector(
        onTap: _toggleUI,
        child: ListView.builder(
          itemCount: widget.chapter.pageUrls.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.chapter.pageUrls[index],
              fit: BoxFit.fitWidth,
              // Optional: Add a loading builder for better UX
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
