import 'package:toktik/domain/entities/video_post.dart';

abstract interface class IVideoPostsDataSource {

  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getFavoritesVideosByPage(String userId, int page);

}