import '../models/album.dart';
import '../models/photo.dart';
import '../services/album_api_service.dart';

class AlbumRepository {
  final AlbumApiService apiService;

  List<Album>? _cachedAlbums;
  List<Photo>? _cachedPhotos;

  AlbumRepository(this.apiService);

  Future<Map<Album, List<Photo>>> fetchAlbumsWithPhotos() async {
    _cachedAlbums ??= await apiService.fetchAlbums();
    _cachedPhotos ??= await apiService.fetchPhotos();

    final Map<int, List<Photo>> photoMap = {};
    for (var photo in _cachedPhotos!) {
      photoMap.putIfAbsent(photo.albumId, () => []).add(photo);
    }

    return {for (var album in _cachedAlbums!) album: photoMap[album.id] ?? []};
  }
}
