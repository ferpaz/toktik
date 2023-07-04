import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:toktik/config/helpers/format_helpers.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconBotton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        const SizedBox(height: 20),
        _CustomIconBotton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconBotton(
            iconData: Icons.play_circle_fill_outlined,
          ),
        ),
      ],
    );
  }
}

class _CustomIconBotton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CustomIconBotton({
    required this.iconData,
    this.value = 0,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(iconData),
          iconSize: 30,
          color: color,
          onPressed: () {},
        ),
        if (value > 0)
          Text(
            FormatHelpers.hummanReadableNumber(value.toDouble()),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
