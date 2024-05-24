import 'package:flutter/material.dart';
import 'package:myapp/models/hero.dart';
import 'package:myapp/screens/hero_detail_screen.dart';
import 'package:myapp/services/hero_service.dart';

class HeroListScreen extends StatelessWidget {
  const HeroListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Super Hero"),
      ),
      body: const HeroList(),
    );
  }
}

class HeroList extends StatefulWidget {
  const HeroList({super.key});

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  List _heros = [];
  final HeroService _heroService = HeroService();

initialize() async {
  _heros = await _heroService.searchHeros("spider-man");
  setState(() {
    _heros = _heros;
  });
}

@override
  void initState() {
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _heros.length,
      itemBuilder:(context, index) {
        return HeroItem(hero: _heros[index]);
      },);
  }
}

class HeroItem extends StatelessWidget {
  const HeroItem({super.key, required this.hero});
  final SuperHero hero;

  // Material de referencia: https://docs.flutter.dev/cookbook/navigation/passing-data 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(hero.image),
      title: Text(hero.name),
      subtitle: Text(hero.fullName),
      onTap:() {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => HeroDetailScreen(hero: hero)
        ));
      },
    );
  }
}