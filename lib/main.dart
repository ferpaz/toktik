import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/domain/datasources/i_video_posts_datasource.dart';
import 'package:toktik/domain/repositories/i_video_posts_repository.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository.dart';
import 'package:toktik/presentation/discover/screens/discover_screen.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<IVideoPostsDataSource>(LocalVideoDatasource());
  getIt.registerSingleton<IVideoPostsRepository>(VideosPostRepository(getIt.get<IVideoPostsDataSource>()));

  runApp(const MyApp());
}

class VideoPostsRepository {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostsRepository = getIt.get<IVideoPostsRepository>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, // los proveedores ejecutan LAZY por defecto, es decir, no se ejecutan hasta que se les llama
          create: (_) => DiscoverProvider(videoPostsRepository: videoPostsRepository)..loadNextPage(), // Operador de cascada (es lo mismo que correr el constructor y luego ejecutar el metodo)
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData,
        home: const DiscoverScreen(),
      ),
    );
  }
}
