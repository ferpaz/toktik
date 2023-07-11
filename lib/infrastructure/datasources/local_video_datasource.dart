import 'package:toktik/domain/datasources/i_video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoDatasource implements IVideoPostsDataSource {
  @override
  Future<List<VideoPost>> getFavoritesVideosByPage(String userId, int page) async {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((video) => LocalVideoModel.fromMap(video).toVideoPostEntity()).toList();
    return newVideos;
  }
}