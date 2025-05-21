import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/blocs/album_bloc.dart';
import 'data/repositories/album_repository.dart';
import 'data/services/album_api_service.dart';
import 'routes/app_router.dart';
import 'package:http/http.dart' as http;

void main() {
  final repo = AlbumRepository(AlbumApiService(http.Client()));
  runApp(MyApp(repo));
}

class MyApp extends StatelessWidget {
  final AlbumRepository repo;

  MyApp(this.repo);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(repo)..add(LoadAlbums()),
      child: MaterialApp.router(
        title: 'Flutter Albums',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
      ),
    );
  }
}
