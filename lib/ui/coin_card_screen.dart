import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double change;
  final double changePercentage;

  const CoinCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      symbol.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    change < 0 ? '${change.toStringAsFixed(2)}' : '+${change.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: change < 0 ? Colors.red : Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    changePercentage < 0 ? '${changePercentage.toStringAsFixed(2)}%' : '+${changePercentage.toStringAsFixed(2)}%',
                    style: TextStyle(
                      color: changePercentage < 0 ? Colors.red : Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
