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

  const MyApp(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(repo)..add(LoadAlbums()),
      child: MaterialApp.router(
        title: 'Flutter Albums',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(
            255,
            40,
            67,
            220,
          ), // This sets the primary color
          scaffoldBackgroundColor: Color(0xFFF5F6FA),
        ),

        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
