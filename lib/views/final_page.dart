import 'package:destini/views/home_page.dart';
import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  final bool isGoodEnding;
  const FinalPage({super.key, required this.isGoodEnding});

  @override
  Widget build(BuildContext context) {
    final title = isGoodEnding ? "🎉 A Magical Ending 🎉" : "💀 A Mysterious End 💀";
    final message = isGoodEnding
        ? "Leo proved his bravery and wisdom! 🌟\nThe Enchanted Forest remembers him as a hero."
        : "Some doors are best left unopened...\nLeo’s journey ends in mystery and shadows. 🌒";

    final color = isGoodEnding ? Colors.green.shade50 : Colors.red.shade50;
    final emoji = isGoodEnding ? "🧙‍♂️✨" : "🌲👻";

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                emoji,
                style: const TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                ),
                child: const Text("🔁 Restart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
