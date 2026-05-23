import '../models/room.dart';
import '../models/user.dart';

class MockData {
  static final currentUser = User(
    id: '1',
    name: 'Leo',
    username: '@leo',
    bio: 'Building cool stuff 🚀\nLearning Flutter & Audio Tech',
    avatarUrl: '',
    followers: 128,
    following: 95,
  );

  static final List<Room> rooms = [
    Room(
      id: '1',
      title: '🎵 Music Production Tips for Beginners',
      club: 'Music Creators Hub',
      speakers: [
        Speaker(name: 'Alice', avatarUrl: '', isModerator: true),
        Speaker(name: 'Bob', avatarUrl: '', isMuted: true),
        Speaker(name: 'Charlie', avatarUrl: ''),
      ],
      listenerCount: 234,
    ),
    Room(
      id: '2',
      title: '💡 Startup Ideas — Open Mic Night',
      club: 'Founders Club',
      speakers: [
        Speaker(name: 'David', avatarUrl: '', isModerator: true),
        Speaker(name: 'Eva', avatarUrl: ''),
        Speaker(name: 'Frank', avatarUrl: '', isMuted: true),
        Speaker(name: 'Grace', avatarUrl: ''),
      ],
      listenerCount: 1089,
    ),
    Room(
      id: '3',
      title: '🧘 Morning Meditation & Mindfulness',
      club: 'Wellness Circle',
      speakers: [
        Speaker(name: 'Hannah', avatarUrl: '', isModerator: true),
        Speaker(name: 'Ian', avatarUrl: ''),
      ],
      listenerCount: 56,
    ),
    Room(
      id: '4',
      title: '🤖 AI & The Future of Work',
      club: 'Tech Talks',
      speakers: [
        Speaker(name: 'Jack', avatarUrl: '', isModerator: true),
        Speaker(name: 'Kate', avatarUrl: ''),
        Speaker(name: 'Liam', avatarUrl: '', isMuted: true),
        Speaker(name: 'Mia', avatarUrl: ''),
        Speaker(name: 'Noah', avatarUrl: ''),
      ],
      listenerCount: 2341,
    ),
    Room(
      id: '5',
      title: '🎮 Game Dev Show & Tell',
      club: 'Indie Gamedev',
      speakers: [
        Speaker(name: 'Olivia', avatarUrl: '', isModerator: true),
        Speaker(name: 'Pete', avatarUrl: ''),
        Speaker(name: 'Quinn', avatarUrl: '', isMuted: true),
      ],
      listenerCount: 178,
    ),
  ];

  static final List<Map<String, String>> upcomingEvents = [
    {
      'title': 'Flutter Live Coding Session',
      'club': 'Mobile Dev Club',
      'time': 'Today, 8:00 PM',
    },
    {
      'title': 'Crypto Market Analysis',
      'club': 'Blockchain Hub',
      'time': 'Tomorrow, 10:00 AM',
    },
    {
      'title': 'Stand-up Comedy Open Mic',
      'club': 'Comedy Club',
      'time': 'Tomorrow, 9:00 PM',
    },
  ];
}
