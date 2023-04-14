class Country {
  final String name;
  final String capital;
  final String cca3;
  final String svg;

  Country({
    required this.name,
    required this.capital,
    required this.cca3,
    required this.svg,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] as String,
      capital: json['capital'][0] as String,
      cca3: json['cca3'][0] as String,
      svg: json['flags']['svg'] as String,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'INSTANCE OF COUNTRY $name';
  }
}
