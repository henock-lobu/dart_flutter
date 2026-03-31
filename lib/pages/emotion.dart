import 'package:flutter/material.dart';

class Emotion extends StatelessWidget {
  final String emoji; // On ajoute une variable pour l'emoji

  const Emotion({
    super.key,
    required this.emoji, // On demande l'emoji à la création
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(15), // Un peu plus arrondi
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        emoji,
        style: const TextStyle(
          fontSize: 23, // Taille de l'emoji
        ),
      ),
    );
  }
}