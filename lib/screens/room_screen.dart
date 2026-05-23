import 'package:flutter/material.dart';
import '../models/room.dart';
import '../widgets/speaker_tile.dart';

class RoomScreen extends StatefulWidget {
  final Room room;

  const RoomScreen({super.key, required this.room});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool _isMuted = true;
  bool _handRaised = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        const Icon(Icons.keyboard_arrow_down, size: 28, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text('All rooms', style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.7))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle, color: Color(0xFFEF4444), size: 8),
                        SizedBox(width: 4),
                        Text('LIVE', style: TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Room content
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      widget.room.club.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.35),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      widget.room.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'Speakers',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: List.generate(
                        widget.room.speakers.length,
                        (i) => SpeakerTile(
                          speaker: widget.room.speakers[i],
                          index: i,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),
                    Divider(color: Colors.white.withOpacity(0.1)),
                    const SizedBox(height: 16),

                    Text(
                      'Listeners (${widget.room.listenerCount})',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(8, (i) {
                        final names = ['Sam', 'Alex', 'Jordan', 'Riley', 'Casey', 'Morgan', 'Taylor', 'Avery'];
                        final colors = [
                          [const Color(0xFF475569), const Color(0xFF334155)],
                          [const Color(0xFF0D9488), const Color(0xFF0F766E)],
                          [const Color(0xFFEA580C), const Color(0xFFC2410C)],
                          [const Color(0xFF4F46E5), const Color(0xFF4338CA)],
                          [const Color(0xFF78716C), const Color(0xFF57534E)],
                          [const Color(0xFF0891B2), const Color(0xFF0E7490)],
                          [const Color(0xFFDB2777), const Color(0xFFBE185D)],
                          [const Color(0xFFD97706), const Color(0xFFB45309)],
                        ];
                        return Column(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: colors[i],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  names[i][0],
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              names[i],
                              style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.4)),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: const Color(0xFF1A1A2E),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A40),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '✌️ Leave quietly',
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      setState(() => _handRaised = !_handRaised);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_handRaised ? '✋ Hand raised!' : 'Hand lowered'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: const Color(0xFF1A1A2E),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _handRaised ? const Color(0xFF8B5CF6).withOpacity(0.2) : const Color(0xFF2A2A40),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.back_hand,
                        color: _handRaised ? const Color(0xFF8B5CF6) : Colors.white38,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  GestureDetector(
                    onTap: () => setState(() => _isMuted = !_isMuted),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isMuted ? const Color(0xFFEF4444).withOpacity(0.15) : const Color(0xFF22C55E).withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isMuted ? Icons.mic_off : Icons.mic,
                        color: _isMuted ? const Color(0xFFEF4444) : const Color(0xFF22C55E),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
