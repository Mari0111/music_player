import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/music_player_screen/music_player_screen_manager.dart';
import 'package:music_player/service_locator.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final manager = getIt<MusicPlayerScreenManager>();

  @override
  void initState() {
    super.initState();
    manager.loadSong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music Player')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/music1.jpg'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          ColoredBox(
            color: Colors.white.withOpacity(0.3),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Spacer(),
                  const ProgressBar(
                    thumbColor: Colors.white,
                    progressBarColor: Colors.white,
                    baseBarColor: Color.fromARGB(255, 255, 159, 191),
                    progress: Duration(minutes: 1),
                    total: Duration(minutes: 3, seconds: 30),
                  ),
                  ValueListenableBuilder<PlayingState>(
                    valueListenable: manager.playingStateNotifier,
                    builder: (context, playingState, child) {
                      switch (playingState) {
                        case PlayingState.loading:
                          return const CircularProgressIndicator();

                        case PlayingState.playing:
                          return IconButton(
                            onPressed: () {
                              manager.pauseSong();
                            },
                            icon: Icon(Icons.pause),
                          );

                        case PlayingState.paused:
                          return IconButton(
                            onPressed: () {
                              manager.playSong();
                            },
                            icon: Icon(Icons.play_arrow),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3
