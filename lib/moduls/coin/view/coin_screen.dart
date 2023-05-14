import 'package:flutter/material.dart';

class CoinScrean extends StatefulWidget {
  const CoinScrean({
    super.key,
  });

  @override
  State<CoinScrean> createState() => _CoinScreanState();
}

class _CoinScreanState extends State<CoinScrean> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'ERROR: Invalid arguments');

    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Coins ${coinName ?? '...'}',
      )),
    );
  }
}
