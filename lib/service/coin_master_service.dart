import 'dart:convert';
import 'package:coin_master/api_endpoint.dart';
import 'package:coin_master/model/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinService {
  Future<List<CoinModel>> fetchCoins() async {
    try {
      final response = await http.get(Uri.parse('${ApiEndpoint.baseUrl}${ApiEndpoint.coinMarketsEndpoint}'));

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        List<CoinModel> coinList = [];
        if (values.isNotEmpty) {
          for (var value in values) {
            if (value != null) {
              Map<String, dynamic> map = value;
              coinList.add(CoinModel.fromJson(map));
            }
          }
        }
        return coinList;
      } else {
        throw Exception('Failed to load coins: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load coins: $e');
    }
  }
}
