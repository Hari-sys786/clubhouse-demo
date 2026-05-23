import 'package:flutter/material.dart';
import '../services/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  user.name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              user.username,
              style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.5)),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _stat('${user.followers}', 'followers'),
                const SizedBox(width: 32),
                _stat('${user.following}', 'following'),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              user.bio,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.6), height: 1.5),
            ),
            const SizedBox(height: 24),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF8B5CF6)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 32),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Interests',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                '🎵 Music', '💻 Tech', '🎮 Gaming', '🧘 Wellness',
                '📱 Mobile Dev', '🎨 Design', '🚀 Startups',
              ].map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF2A2A40), width: 1),
                ),
                child: Text(tag, style: const TextStyle(fontSize: 13, color: Colors.white70)),
              )).toList(),
            ),

            const SizedBox(height: 32),

            Text(
              'Member since May 2026',
              style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.3)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.4))),
      ],
    );
  }
}
