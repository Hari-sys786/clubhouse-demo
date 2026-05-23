import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final bool embedded;

  const ExploreScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final content = ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2A2A40), width: 1),
          ),
          child: const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: Colors.white38),
              hintText: 'Search people, clubs, rooms...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white30),
            ),
          ),
        ),
        const SizedBox(height: 24),

        const Text(
          'Trending Clubs 🔥',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _clubCard('Tech Talks', '🤖', '12.5K members', const Color(0xFF3B82F6)),
              _clubCard('Music Hub', '🎵', '8.2K members', const Color(0xFFEF4444)),
              _clubCard('Founders', '💡', '15.1K members', const Color(0xFF8B5CF6)),
              _clubCard('Wellness', '🧘', '5.7K members', const Color(0xFF22D3EE)),
              _clubCard('Gaming', '🎮', '9.8K members', const Color(0xFFF59E0B)),
            ],
          ),
        ),
        const SizedBox(height: 24),

        const Text(
          'People to Follow',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 12),

        ...[
          {'name': 'Sarah Chen', 'bio': 'AI Researcher @ Stanford', 'letter': 'S', 'color1': 0xFF8B5CF6, 'color2': 0xFF6D28D9},
          {'name': 'Marcus Johnson', 'bio': 'Music Producer & DJ', 'letter': 'M', 'color1': 0xFFEF4444, 'color2': 0xFFDC2626},
          {'name': 'Priya Patel', 'bio': 'Startup Founder | YC W26', 'letter': 'P', 'color1': 0xFF22D3EE, 'color2': 0xFF0891B2},
          {'name': 'James Kim', 'bio': 'Game Developer | Unity', 'letter': 'J', 'color1': 0xFF3B82F6, 'color2': 0xFF2563EB},
        ].map((person) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2A2A40), width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(person['color1'] as int), Color(person['color2'] as int)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    person['letter'] as String,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(person['name'] as String, style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                    Text(person['bio'] as String, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 13)),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF8B5CF6)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text(
                  'Follow',
                  style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 13),
                ),
              ),
            ],
          ),
        )),

        const SizedBox(height: 80),
      ],
    );

    if (embedded) return content;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Explore', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: content,
    );
  }

  Widget _clubCard(String name, String emoji, String members, Color color) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const Spacer(),
          Text(name, style: TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 14)),
          const SizedBox(height: 2),
          Text(members, style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.4))),
        ],
      ),
    );
  }
}
