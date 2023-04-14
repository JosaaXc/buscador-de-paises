import 'package:buscador_paises/search/country_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Culqueir cosa'),
          MaterialButton(
              color: Colors.blue,
              shape: const StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () {
                showSearch(context: context, delegate: CountrySearchDelegate());
              },
              child: const Text(
                'Buscar',
                style: TextStyle(color: Colors.white),
              ))
        ],
      )),
    );
  }
}
