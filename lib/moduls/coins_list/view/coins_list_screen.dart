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
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return CoinTile(
              index: index,
            );
          }),
    );
  }
}
