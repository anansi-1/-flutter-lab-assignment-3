import '../models/album.dart';
import '../models/photo.dart';
import '../services/album_api_service.dart';

class AlbumRepository {
  final AlbumApiService apiService;

  AlbumRepository(this.apiService);

  Future<Map<Album, List<Photo>>> fetchAlbumsWithPhotos() async {
    final albums = await apiService.fetchAlbums();
    final photos = await apiService.fetchPhotos();

    final Map<int, List<Photo>> photoMap = {};
    for (var photo in photos) {
      photoMap.putIfAbsent(photo.albumId, () => []).add(photo);
    }

    return {for (var album in albums) album: photoMap[album.id] ?? []};
  }
}
