class ApiEndpoint {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';
  static const String coinMarketsEndpoint = '/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
}
