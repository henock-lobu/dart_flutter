import 'dart:io'; // Nécessaire pour afficher l'image choisie
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:model/pages/methodes.dart';
//import 'package:flutter/database/DBsuite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Déclaration des contrôleurs pour récupérer les textes
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // 2. Variable pour stocker le chemin de l'image (le "browser")
  String? _selectedImagePath;

  // 3. Fonction pour ouvrir le Browser de fichiers
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _selectedImagePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 122, 187),

      // --- LES TROIS BARRES (DRAWER) ---
      drawer: Drawer(
        child: FutureBuilder<Map<String, dynamic>?>(
          future: Methodes
              .getDernierUtilisateur(), // On demande à la méthode le dernier inscrit
          builder: (context, snapshot) {
            // On récupère les infos ou on met des valeurs par défaut
            String nom = snapshot.data?['nom'] ?? "Invité";
            String email = snapshot.data?['email'] ?? "Aucun compte";
            String? photoPath = snapshot.data?['photo'];

            return Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: (photoPath != null && photoPath.isNotEmpty)
                        ? FileImage(File(photoPath))
                        : null,
                    child: photoPath == null ? const Icon(Icons.person) : null,
                  ),
                  accountName: Text(nom),
                  accountEmail: Text(email),
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text("Voir tous les inscrits"),
                  onTap: () {
                    // Action pour ouvrir la liste
                  },
                ),
              ],
            );
          },
        ),
      ),

      appBar: AppBar(
        title: const Text("Inscription"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // Flutter ajoute automatiquement l'icône des 3 barres si un drawer est présent
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Créer un profil',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Conteneur du Formulaire
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // --- SECTION PHOTO (BROWSER) ---
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue[100],
                      backgroundImage: _selectedImagePath != null
                          ? FileImage(File(_selectedImagePath!))
                          : null,
                      child: _selectedImagePath == null
                          ? const Icon(Icons.camera_alt,
                              size: 40, color: Colors.blue)
                          : null,
                    ),
                  ),
                  const Text("Cliquez pour choisir une photo",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 20),

                  // --- CHAMPS DE TEXTE ---
                  TextField(
                    controller: _nomController,
                    decoration: const InputDecoration(
                        labelText: 'Nom', prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Age', prefixIcon: Icon(Icons.cake)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: 'Téléphone', prefixIcon: Icon(Icons.phone)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- BOUTON ENREGISTRER ---
            // Dans le bouton de ton formulaire
            ElevatedButton(
              onPressed: () async {
                // On appelle la méthode avec les contrôleurs
                await Methodes.sauvegarderUtilisateur(
                  nom: _nomController.text,
                  email: _emailController.text,
                  age: _ageController.text,
                  telephone: _phoneController.text,
                  photo: _selectedImagePath ?? "",
                );

                // Notification visuelle
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(" Enregistré dans base.sqlite !"),
                    backgroundColor: Colors.green,
                  ),
                );

                // On vide les champs
                _nomController.clear();
                _emailController.clear();
                _ageController.clear();
                _phoneController.clear();
                setState(() {
                  _selectedImagePath = null;
                });
              },
              child: const Text("SAUVEGARDER"),
            )
          ],
        ),
      ),
    );
  }
}
