import 'package:flutter/material.dart';
import '../../data/models/album.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumTile({required this.album, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          title: Text(
            album.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          thickness: 0.8,
          color: Colors.grey.shade300,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
