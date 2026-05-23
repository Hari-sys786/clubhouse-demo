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
                gradient: LinearGradient(
                  colors: _avatarGradient(index),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
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
                  color: const Color(0xFF1A1A2E),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2A2A40), width: 1),
                ),
                child: const Icon(Icons.mic_off, size: 14, color: Color(0xFFEF4444)),
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
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Color> _avatarGradient(int index) {
    final gradients = [
      [const Color(0xFF8B5CF6), const Color(0xFF6D28D9)],
      [const Color(0xFFEF4444), const Color(0xFFDC2626)],
      [const Color(0xFF22D3EE), const Color(0xFF0891B2)],
      [const Color(0xFFF59E0B), const Color(0xFFD97706)],
      [const Color(0xFF3B82F6), const Color(0xFF2563EB)],
    ];
    return gradients[index % gradients.length];
  }
}
