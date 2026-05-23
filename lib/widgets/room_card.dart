import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback onTap;

  const RoomCard({super.key, required this.room, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF2A2A40), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Club name
            Text(
              room.club.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.35),
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 6),

            // Room title
            Text(
              room.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.3,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),

            // Speakers row
            Row(
              children: [
                // Speaker avatars (stacked)
                SizedBox(
                  width: 30.0 + (room.speakers.length - 1) * 20.0,
                  height: 36,
                  child: Stack(
                    children: List.generate(
                      room.speakers.length.clamp(0, 4),
                      (index) => Positioned(
                        left: index * 20.0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _avatarGradient(index),
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF1A1A2E), width: 2),
                          ),
                          child: Center(
                            child: Text(
                              room.speakers[index].name[0],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Speaker names + listener count
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.speakers
                            .take(3)
                            .map((s) => '${s.name} ${s.isModerator ? "🎤" : ""}')
                            .join(' · '),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.6),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            '${room.speakers.length}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          Icon(Icons.mic, size: 12, color: Colors.white.withOpacity(0.4)),
                          const SizedBox(width: 8),
                          Text(
                            _formatCount(room.listenerCount),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          Icon(Icons.person, size: 12, color: Colors.white.withOpacity(0.4)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _avatarGradient(int index) {
    final gradients = [
      [const Color(0xFF8B5CF6), const Color(0xFF6D28D9)],
      [const Color(0xFFEF4444), const Color(0xFFDC2626)],
      [const Color(0xFF22D3EE), const Color(0xFF0891B2)],
      [const Color(0xFFF59E0B), const Color(0xFFD97706)],
    ];
    return gradients[index % gradients.length];
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
