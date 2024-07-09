class CoinModel {
  CoinModel({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  final String name;
  final String symbol;
  final String imageUrl;
  final num price;
  final num change;
  final num changePercentage;

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      imageUrl: json['image'] as String,
      price: json['current_price'] as num,
      change: json['price_change_24h'] as num,
      changePercentage: json['price_change_percentage_24h'] as num,
    );
  }
}

