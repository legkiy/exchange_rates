import 'package:exchange_rates/utils/get_exchange_data.dart';
import 'package:exchange_rates/utils/interfaces/coin_data_list.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ExcahgeListScrean extends StatefulWidget {
  const ExcahgeListScrean({
    super.key,
  });

  @override
  State<ExcahgeListScrean> createState() => _ExcahgeListScreanState();
}

class _ExcahgeListScreanState extends State<ExcahgeListScrean> {
  int activeIndex = -1;
  List<CoinDataListInterface>? _coinsList;

  @override
  void initState() {
    _loadCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Exchange Rates'),
      ),
      body: _coinsList == null
          ? const SizedBox()
          : ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              itemCount: _coinsList!.length,
              separatorBuilder: (context, index) => const Divider(thickness: 2),
              itemBuilder: (context, index) {
                final coin = _coinsList![index];
                return CoinTile(
                  coin: coin,
                );
              }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _loadCoins();
          },
          child: const Icon(
            Icons.refresh,
            size: 40,
          )),
    );
  }

  Future<void> _loadCoins() async {
    _coinsList = await GetExchangeData().getCoinstList('EUR');
    setState(() {});
  }
}
