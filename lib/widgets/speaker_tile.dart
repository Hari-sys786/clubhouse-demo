import 'package:flutter/material.dart';
import '../models/room.dart';

class SpeakerTile extends StatelessWidget {
  final Speaker speaker;
  final int index;

  const SpeakerTile({super.key, required this.speaker, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: _avatarColor(index),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  speaker.name[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            if (speaker.isMuted)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(Icons.mic_off, size: 14, color: Colors.red),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (speaker.isModerator)
              const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Text('🎤', style: TextStyle(fontSize: 10)),
              ),
            Text(
              speaker.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color _avatarColor(int index) {
    final colors = [
      const Color(0xFF6C5CE7),
      const Color(0xFFE17055),
      const Color(0xFF00B894),
      const Color(0xFFFDAA5E),
      const Color(0xFF0984E3),
    ];
    return colors[index % colors.length];
  }
}
