import 'package:flutter/material.dart';
import '../../data/models/album.dart';
import '../../data/models/photo.dart';

class AlbumDetailScreen extends StatelessWidget {
  final Album album;
  final List<Photo> photos;

  const AlbumDetailScreen({required this.album, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Album Title: ${album.title}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              'Photos in Album: ${photos.length}',
              style: TextStyle(fontSize: 16),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(photos[index].title),
                    // No image shown
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
