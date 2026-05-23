class Speaker {
  final String name;
  final String avatarUrl;
  final bool isMuted;
  final bool isModerator;

  Speaker({
    required this.name,
    required this.avatarUrl,
    this.isMuted = false,
    this.isModerator = false,
  });
}

class Room {
  final String id;
  final String title;
  final String club;
  final List<Speaker> speakers;
  final int listenerCount;
  final bool isLive;

  Room({
    required this.id,
    required this.title,
    required this.club,
    required this.speakers,
    required this.listenerCount,
    this.isLive = true,
  });
}
