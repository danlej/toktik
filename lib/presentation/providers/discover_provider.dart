import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  /// El Repository será el que me permita lanzar las peticiones respectivas.
  /// El DataSource es la fuente de la data, en la cual nosotros vamos a poder tener varias (ej: local, internet, json local, datastorage, etc.)
  /// El DataSource no lo voy a colocar en el DiscoverProvider, sino en el Repository.

  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository,
  });

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
