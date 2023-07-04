import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromMap(Map<String, dynamic> data) => LocalVideoModel(
      caption: data['caption'] ?? 'No video caption',
      videoUrl: data['videoUrl'] ?? '',
      likes: data['likes'] ?? 0,
      views: data['views'] ?? 0,
    );

  VideoPost toVideoPostEntity() => VideoPost(
      caption: caption,
      videoUrl: videoUrl,
      likes: likes,
      views: views,
    );
}
