class User {
  final String id;
  final String name;
  final String username;
  final String bio;
  final String avatarUrl;
  final int followers;
  final int following;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.avatarUrl,
    this.followers = 0,
    this.following = 0,
  });
}
