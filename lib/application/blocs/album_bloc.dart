import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/album.dart';
import '../../data/models/photo.dart';
import '../../data/repositories/album_repository.dart';

// Events
abstract class AlbumEvent {}

class LoadAlbums extends AlbumEvent {}

// States
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final Map<Album, List<Photo>> data;
  AlbumLoaded(this.data);
}

class AlbumError extends AlbumState {
  final String message;
  AlbumError(this.message);
}

// Bloc
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repo;

  AlbumBloc(this.repo) : super(AlbumInitial()) {
    on<LoadAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final data = await repo.fetchAlbumsWithPhotos();
        emit(AlbumLoaded(data));
      } catch (e) {
        emit(AlbumError('Failed to load albums.'));
      }
    });
  }
}
