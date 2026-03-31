import 'package:flutter/material.dart';
import 'package:model/pages/emotion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Fond de l'application
      backgroundColor: Colors.blue[800],

      // 2. Corps de la page (évite les encoches du téléphone)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [

            // 3. Barre d'en-tête (Nom + Date et Icône)
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Bloc texte : Nom et Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, Henock!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "22/03/2026",
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // Bloc Icône : Bouton de notification
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          // input de recherche
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recherche', style:
                TextStyle(color: Colors.white,),),
                Icon( Icons.search,
                  color: Colors.white,
                  size: 20,


                ),

              ],
            ),
          ),

          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Comment ça va ?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.more_horiz, // Trois petits points pour le style
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 24),
          // les 4 elements

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Column( // Ta colonne pour empiler verticalement
                    children: [
                      // 1. Ton widget d'émotion
                      const Emotion(
                        emoji: "☹️",
                      ),

                      // 2. Ton espace (SizedBox)
                      const SizedBox(
                        height: 8,
                      ),

                      // 3. Ton texte
                      const Text(
                        'Bad',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column( // Ta colonne pour empiler verticalement
                    children: [
                      // 1. Ton widget d'émotion
                      const Emotion(
                        emoji: "☹️",
                      ),

                      // 2. Ton espace (SizedBox)
                      const SizedBox(
                        height: 8,
                      ),

                      // 3. Ton texte
                      const Text(
                        'FAR',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column( // Ta colonne pour empiler verticalement
                    children: [
                      // 1. Ton widget d'émotion
                      const Emotion(
                        emoji: "☹️",
                      ),

                      // 2. Ton espace (SizedBox)
                      const SizedBox(
                        height: 8,
                      ),

                      // 3. Ton texte
                      const Text(
                        'Bad',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column( // Ta colonne pour empiler verticalement
                    children: [
                      // 1. Ton widget d'émotion
                      const Emotion(
                        emoji: "☹️",
                      ),

                      // 2. Ton espace (SizedBox)
                      const SizedBox(
                        height: 8,
                      ),

                      // 3. Ton texte
                      const Text(
                        'thor',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 12,),
              // 1. On utilise Expanded pour occuper tout le reste de l'écran
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white, // Le fond devient blanc
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Titre de la section blanche
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Plan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),

                      // C'est ici que tu mettras ta liste d'exercices plus tard
                    ],
                  ),
                ),
              )

        ],

      ),
    ),
    ),
    );

  }
}