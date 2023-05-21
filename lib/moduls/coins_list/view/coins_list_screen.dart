import 'package:exchange_rates/utils/get_exchange_data.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Exchange Rates'),
      ),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => const Divider(thickness: 2),
          itemBuilder: (context, index) {
            return CoinTile(
              index: index,
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            GetExchangeData().getCoinstList('1');
          },
          child: const Icon(
            Icons.refresh,
            size: 40,
          )),
    );
  }
}
