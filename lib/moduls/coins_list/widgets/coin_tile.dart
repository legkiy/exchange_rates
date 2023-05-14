import 'dart:math';
import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final textBody = Theme.of(context).textTheme.bodyMedium;
    final subtitlText = Theme.of(context).textTheme.bodySmall;

    String coinName = index.toString();
    int randomCoast = Random().nextInt(10000) + 20;

    return ListTile(
      leading: Image.network(
        'https://pngimg.com/uploads/bitcoin/bitcoin_PNG7.png',
        height: 40,
      ),
      title: Text(
        'value $index',
        style: textBody,
      ),
      subtitle: Text(
        'coast: $randomCoast \$',
        style: subtitlText,
      ),
      trailing: const Icon(
        Icons.ssid_chart_sharp,
        size: 50,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin:', arguments: coinName);
      },
    );
  }
}
