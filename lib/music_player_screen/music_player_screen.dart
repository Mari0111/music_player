import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
