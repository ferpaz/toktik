import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:toktik/presentation/widgets/shared/video_background.dart';

class FullScreenPlayer extends StatefulWidget {
  final String caption;
  final String videoUrl;

  const FullScreenPlayer({super.key, required this.caption, required this.videoUrl});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;
  bool isInitialized = false;
  // late Future<void> _initializeVideoPlayerFuture;

  Future<void> processVideo() async {
    if (isInitialized) {
      return;
    }

    isInitialized = true;
    return _controller.initialize();
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      //..setVolume(0.5)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: processVideo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator.adaptive(strokeWidth: 2));
        }

        return GestureDetector(
          onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                return;
              }
              _controller.play();
            },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),

                VideoBackground(
                  stops: const [0.8, 1.0],
                ),

                Positioned(
                  bottom: 0,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Text(
        caption,
        maxLines: 2,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
