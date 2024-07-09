import 'dart:async';
import 'package:coin_master/model/coin_model.dart';
import 'package:coin_master/service/coin_master_service.dart';
import 'package:coin_master/ui/coin_card_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CoinModel> coinList = [];
  final CoinService coinService = CoinService();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    fetchCoins();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) => fetchCoins());
  }

  Future<void> fetchCoins() async {
    try {
      List<CoinModel> coins = await coinService.fetchCoins();
      setState(() {
        coinList = coins;
      });
    } catch (e) {
      print('Error fetching coins: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching coins: $e'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Coin Master',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: coinList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          return CoinCard(
            name: coinList[index].name,
            symbol: coinList[index].symbol,
            imageUrl: coinList[index].imageUrl,
            price: coinList[index].price.toDouble(),
            change: coinList[index].change.toDouble(),
            changePercentage: coinList[index].changePercentage.toDouble(),
          );
        },
      ),

    );
  }
}
