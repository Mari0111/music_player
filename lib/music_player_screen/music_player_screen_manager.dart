import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum PlayingState {
  loading,
  playing,
  paused,
}

class MusicPlayerScreenManager {
  final playingStateNotifier = ValueNotifier<PlayingState>(PlayingState.paused);

  final player = AudioPlayer();

  Future<void> loadSong() async {
    print('loading song...');
    playingStateNotifier.value = PlayingState.loading;
    final duration = await player.setUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
    playingStateNotifier.value = PlayingState.paused;
    print('finished loading');
  }

  void playSong() {
    player.play();
    print('playing song...');
    playingStateNotifier.value = PlayingState.playing;
  }

  void pauseSong() {
    print('paused song');
    player.pause();
    playingStateNotifier.value = PlayingState.paused;
  }
}
