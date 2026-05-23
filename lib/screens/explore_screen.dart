import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final bool embedded;

  const ExploreScreen({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final content = ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (!embedded) ...[
          const SizedBox(height: 8),
        ],

        // Search bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: Colors.grey),
              hintText: 'Search people, clubs, rooms...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Trending clubs
        const Text(
          'Trending Clubs 🔥',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _clubCard('Tech Talks', '🤖', '12.5K members', const Color(0xFF0984E3)),
              _clubCard('Music Hub', '🎵', '8.2K members', const Color(0xFFE17055)),
              _clubCard('Founders', '💡', '15.1K members', const Color(0xFF6C5CE7)),
              _clubCard('Wellness', '🧘', '5.7K members', const Color(0xFF00B894)),
              _clubCard('Gaming', '🎮', '9.8K members', const Color(0xFFFDAA5E)),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // People to follow
        const Text(
          'People to Follow',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        ...[
          {'name': 'Sarah Chen', 'bio': 'AI Researcher @ Stanford', 'letter': 'S', 'color': 0xFF6C5CE7},
          {'name': 'Marcus Johnson', 'bio': 'Music Producer & DJ', 'letter': 'M', 'color': 0xFFE17055},
          {'name': 'Priya Patel', 'bio': 'Startup Founder | YC W26', 'letter': 'P', 'color': 0xFF00B894},
          {'name': 'James Kim', 'bio': 'Game Developer | Unity', 'letter': 'J', 'color': 0xFF0984E3},
        ].map((person) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(person['color'] as int),
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
                    Text(person['name'] as String, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(person['bio'] as String, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF6C5CE7)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text(
                  'Follow',
                  style: TextStyle(color: Color(0xFF6C5CE7), fontSize: 13),
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
      backgroundColor: const Color(0xFFF2EFE5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EFE5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Explore', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
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
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const Spacer(),
          Text(name, style: TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 14)),
          const SizedBox(height: 2),
          Text(members, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
