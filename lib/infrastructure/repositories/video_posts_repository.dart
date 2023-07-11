import 'package:toktik/domain/datasources/i_video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/i_video_posts_repository.dart';

class VideosPostRepository implements IVideoPostsRepository {

  final IVideoPostsDataSource videoPostsDataSource;

  VideosPostRepository(
    this.videoPostsDataSource
  );

  @override
  Future<List<VideoPost>> getFavoritesVideosByPage(String userId, int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostsDataSource.getTrendingVideosByPage(page);
  }
}