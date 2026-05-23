import 'package:flutter/material.dart';
import '../services/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF2EFE5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EFE5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                color: Color(0xFF6C5CE7),
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

            // Name
            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user.username,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _stat('${user.followers}', 'followers'),
                const SizedBox(width: 32),
                _stat('${user.following}', 'following'),
              ],
            ),
            const SizedBox(height: 20),

            // Bio
            Text(
              user.bio,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.5),
            ),
            const SizedBox(height: 24),

            // Edit profile button
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF6C5CE7)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Color(0xFF6C5CE7), fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 32),

            // Interests
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Interests',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.grey[800]),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(tag, style: const TextStyle(fontSize: 13)),
              )).toList(),
            ),

            const SizedBox(height: 32),

            // Member since
            Text(
              'Member since May 2026',
              style: TextStyle(fontSize: 13, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
      ],
    );
  }
}
