import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/album_list_screen.dart';
import '../presentation/screens/album_detail_screen.dart';
import '../data/models/album.dart';
import '../data/models/photo.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => AlbumListScreen()),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return AlbumDetailScreen(
          album: data['album'] as Album,
          photos: data['photos'] as List<Photo>,
        );
      },
    ),
  ],
);
