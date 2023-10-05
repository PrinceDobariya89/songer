import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String? videoUrl;
  const VideoScreen({super.key, required this.videoUrl});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    if (widget.videoUrl != '') {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
    }
    _controller.initialize();
    setState(() {
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(
              controller: ChewieController(
                  autoPlay: true,
                  looping: true,
                  hideControlsTimer: const Duration(seconds: 2),
                  materialProgressColors:
                      ChewieProgressColors(playedColor: Colors.red),
                  aspectRatio: 16 / 9,
                  videoPlayerController: _controller)),
        ),
      ),
    );
  }
}
