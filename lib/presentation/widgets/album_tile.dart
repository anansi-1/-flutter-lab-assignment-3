import 'package:flutter/material.dart';
import '../../data/models/album.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumTile({required this.album, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                album.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Divider(height: 1, thickness: 0.8, color: Colors.grey.shade300),
            ],
          ),
        ),
      ),
    );
  }
}
