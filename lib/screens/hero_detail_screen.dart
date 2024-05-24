import 'package:flutter/material.dart';
import 'package:myapp/models/hero.dart';

// Para la navegación se utilizó como referncia la documentación de flutter
// https://docs.flutter.dev/cookbook/navigation/passing-data
// El proyecto fue desarrollado en IDX, es un editor de código para distintos lenguajes (como VS code) creado por Google 
// el cual se puede usar en el navegador e incluye un emulador propio, recomendado para utilizar menos recursos de la pc

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key, required this.hero});

  final SuperHero hero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Super Hero Detail"),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 300,
          child: Image.network(hero.image, // Replace with the actual image URL
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
              hero.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoCard(label: 'Strength', value: hero.strength),
                InfoCard(label: 'Speed', value: hero.speed),
                InfoCard(label: 'Power', value: hero.power),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              hero.placeOfBirth,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            ]),
          ),
        ),
      ],)
    );
  }
}

 class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
         Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}