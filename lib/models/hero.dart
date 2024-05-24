class SuperHero {
  final String name;
  final String fullName;
  final String image;
  final String placeOfBirth;
  final String speed;
  final String strength;
  final String power;

  const SuperHero({
    required this.name,
    required this.fullName,
    required this.image,
    required this.placeOfBirth,
    required this.speed,
    required this.strength,
    required this.power,
  });

  SuperHero.fromJson(Map<String, dynamic> map)
      : name = map["name"],
        fullName = map["biography"]["full-name"],
        image = map["image"]["url"],
        placeOfBirth = map["biography"]["place-of-birth"],
        speed = map["powerstats"]["speed"],
        strength = map["powerstats"]["strength"],
        power = map["powerstats"]["power"]
        ;
}
