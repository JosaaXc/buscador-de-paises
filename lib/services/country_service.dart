import 'package:buscador_paises/models/country.dart';
import 'package:dio/dio.dart';

class CountryService {
  final _dio = new Dio();

  Future<List<Country>> getCountryByName(String name) async {
    try {
      final url = 'https://restcountries.com/v3.1/name/$name';
      final resp = await _dio.get(url);
      final List<dynamic> countryList = resp.data;
      return countryList.map((obj) => Country.fromJson(obj)).toList();
      print(countryList);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
