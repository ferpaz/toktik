import 'package:flutter/material.dart';

import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/i_video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {

  final IVideoPostsRepository videoPostsRepository;

  DiscoverProvider({
    required this.videoPostsRepository
  });

  // Add your DiscoverProvider members here
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    var newVideos = await videoPostsRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
