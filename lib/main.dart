
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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF10131F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            padding: const EdgeInsets.all(22),
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Join tournaments. Play. Win!'),
                SizedBox(height: 8),
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
          tournamentCard('Solo Battle', 'SOLO', 'Free Entry', '৳500'),
          tournamentCard('Duo Clash', 'DUO', 'Entry: ৳20', '৳1,000'),
          tournamentCard(
            'Squad Championship',
            'SQUAD',
            'Entry: ৳50',
            '৳2,000',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AuthPage(),
                  ),
                );
              },
              icon: const Icon(Icons.login),
              label: const Text('Login / Register'),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Demo tournament data',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget tournamentCard(
    String title,
    String mode,
    String entry,
    String prize,
  ) {
    return Card(
      color: const Color(0xFF1B2030),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const Icon(
          Icons.emoji_events,
          color: Colors.orangeAccent,
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text('$mode • $entry'),
        ),
        trailing: Text(
          prize,
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool isRegister = true;
  bool hidePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    final phone = phoneController.text.trim();
    final password = passwordController.text;

    if (phone.length < 6) {
      showMessage('সঠিক ফোন নম্বর লিখুন।');
      return;
    }

    if (password.length < 6) {
      showMessage('পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের দিন।');
      return;
    }

    showMessage(
      'এটি ডেমো স্ক্রিন। আসল অ্যাকাউন্ট চালু করতে '
      'সার্ভার ও নিরাপদ লগইন ব্যবস্থা যুক্ত করতে হবে।',
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Account')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.sports_esports,
                size: 72,
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 16),
              Text(
                isRegister ? 'Create Account' : 'Welcome Back',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isRegister
                    ? 'Register for FF Tournament'
                    : 'Login to your account',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '01XXXXXXXXX',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: submitForm,
                  child: Text(
                    isRegister ? 'Create Account' : 'Login',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isRegister = !isRegister;
                  });
                },
                child: Text(
                  isRegister
                      ? 'Already have an account? Login'
                      : 'New player? Create Account',
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Demo only: no account is saved and no SMS is sent.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
