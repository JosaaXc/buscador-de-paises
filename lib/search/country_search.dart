import 'package:buscador_paises/models/country.dart';
import 'package:buscador_paises/services/country_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountrySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Text('No hay valor en el query');
    }

    final countryService = CountryService();

    return FutureBuilder(
      future: countryService.getCountryByName(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //crear la lista
          return _showCountries(snapshot.data);
        } else {
          //loading
          return Center(child: CircularProgressIndicator(strokeWidth: 4));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(title: Text('Suggestions'));
  }
}

Widget _showCountries(List<Country> countries) {
  return ListView.builder(
    itemCount: countries.length,
    itemBuilder: (_, i) {
      final pais = countries[i];

      return ListTile(
        leading: SvgPicture.network(pais.svg, width: 40),
        title: Text(pais.name),
        subtitle: Text(pais.capital),
        trailing: Text(pais.cca3),
        onTap: () {
          print(pais);
        },
      );
    },
  );
}
