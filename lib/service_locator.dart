import 'package:get_it/get_it.dart';
import 'package:music_player/data/song_api.dart';
import 'package:music_player/home_screen/home_screen.dart';
import 'package:music_player/home_screen/home_screen_manager.dart';
import 'package:music_player/music_player_screen/music_player_screen_manager.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<SongApi>(() => FakeSongApi());
  getIt.registerLazySingleton<HomeScreenManager>(() => HomeScreenManager());
  getIt.registerLazySingleton<MusicPlayerScreenManager>(
      () => MusicPlayerScreenManager());
}
