import 'package:flutter/material.dart';

import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSource

  DiscoverProvider();

  // Add your DiscoverProvider members here
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    var newVideos = videoPosts.map((video) => LocalVideoModel.fromMap(video).toVideoPostEntity()).toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}