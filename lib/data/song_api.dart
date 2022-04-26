abstract class SongApi {
  Future<List<String>> getSongs();
}

class FakeSongApi extends SongApi {
  @override
  Future<List<String>> getSongs() async {
    return [
      'Song 1',
      'Song 2',
      'Song 3',
    ];
  }
}
