import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  /// El Repository será el que me permita lanzar las peticiones respectivas.
  /// El DataSource es la fuente de la data, en la cual nosotros vamos a poder tener varias.
  /// Ej: data local, data en internet, data en un json local, etc. El DataSource no lo
  /// voy a colocar en el DiscoverProvider, sino en el Repository.
  //TODO: Repository, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
