import 'package:flutter/material.dart';

void main() {
  runApp(const FFTournamentApp());
}

class FFTournamentApp extends StatelessWidget {
  const FFTournamentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FF Tournament',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF10131F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
      ),
      home: const TournamentHome(),
    );
  }
}

class TournamentHome extends StatelessWidget {
  const TournamentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🔥 FF TOURNAMENT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1B2030),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEA580C), Color(0xFF9A3412)],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME, WARRIOR!',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Join tournaments. Play. Win!'),
                SizedBox(height: 12),
                Text('SOLO • DUO • SQUAD'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '🎮 Available Tournaments',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          tournamentCard(
            title: 'Solo Battle',
            mode: 'SOLO',
            entry: 'Free Entry',
            prize: 'Prize: ৳500',
          ),
          tournamentCard(
            title: 'Duo Clash',
            mode: 'DUO',
            entry: 'Entry: ৳20',
            prize: 'Prize: ৳1,000',
          ),
          tournamentCard(
            title: 'Squad Championship',
            mode: 'SQUAD',
            entry: 'Entry: ৳50',
            prize: 'Prize: ৳2,000',
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Coming Soon'),
                  content: const Text(
                    'Tournament registration and account '
                    'features need to be connected next.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.login),
            label: const Text('Login / Register'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Demo screen: tournaments and prizes are examples.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget tournamentCard({
    required String title,
    required String mode,
    required String entry,
    required String prize,
  }) {
    return Card(
      color: const Color(0xFF1B2030),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Mode: $mode'),
            Text(entry),
            Text(
              prize,
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
