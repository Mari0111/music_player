import 'package:flutter/cupertino.dart';
import 'package:music_player/data/song_api.dart';
import 'package:music_player/service_locator.dart';

class HomeScreenManager {
  final songListNotifier = ValueNotifier<List<String>>([]);
  final songApi = getIt<SongApi>();

  Future<void> updateSongs() async {
    final songs = await songApi.getSongs();
    songListNotifier.value = songs;
  }
}
