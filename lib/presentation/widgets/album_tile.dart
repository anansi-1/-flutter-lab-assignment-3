import 'package:flutter/material.dart';
import '../../data/models/album.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumTile({required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(album.title), onTap: onTap);
  }
}
