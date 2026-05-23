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
      backgroundColor: const Color(0xFFF2EFE5),
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
                    child: const Row(
                      children: [
                        Icon(Icons.keyboard_arrow_down, size: 28),
                        SizedBox(width: 4),
                        Text('All rooms', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle, color: Colors.red, size: 8),
                        SizedBox(width: 4),
                        Text('LIVE', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Club name
                    Text(
                      widget.room.club.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Room title
                    Text(
                      widget.room.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Speakers section
                    const Text(
                      'Speakers',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Speaker grid
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
                    Divider(color: Colors.grey[200]),
                    const SizedBox(height: 16),

                    // Listeners section
                    Text(
                      'Listeners (${widget.room.listenerCount})',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Mock listener avatars
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(8, (i) {
                        final names = ['Sam', 'Alex', 'Jordan', 'Riley', 'Casey', 'Morgan', 'Taylor', 'Avery'];
                        final colors = [
                          Colors.blueGrey,
                          Colors.teal,
                          Colors.deepOrange,
                          Colors.indigo,
                          Colors.brown,
                          Colors.cyan,
                          Colors.pink,
                          Colors.amber,
                        ];
                        return Column(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: colors[i],
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
                              style: const TextStyle(fontSize: 11, color: Colors.grey),
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
              color: Colors.white,
              child: Row(
                children: [
                  // Leave button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '✌️ Leave quietly',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),

                  // Raise hand
                  GestureDetector(
                    onTap: () {
                      setState(() => _handRaised = !_handRaised);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_handRaised ? '✋ Hand raised!' : 'Hand lowered'),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _handRaised ? const Color(0xFF6C5CE7).withOpacity(0.1) : Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.back_hand,
                        color: _handRaised ? const Color(0xFF6C5CE7) : Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Mute/unmute
                  GestureDetector(
                    onTap: () => setState(() => _isMuted = !_isMuted),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isMuted ? Colors.red.withOpacity(0.1) : const Color(0xFF5DB075).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isMuted ? Icons.mic_off : Icons.mic,
                        color: _isMuted ? Colors.red : const Color(0xFF5DB075),
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
