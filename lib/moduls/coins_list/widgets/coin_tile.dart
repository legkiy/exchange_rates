import 'package:flutter/material.dart';
import '../../../utils/interfaces/coin_data_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.coin,
  });

  final CoinDataListInterface coin;

  @override
  Widget build(BuildContext context) {
    final textBody = Theme.of(context).textTheme.bodyMedium;
    final subtitlText = Theme.of(context).textTheme.bodySmall;

    final Map<String, String> icons = {
      'AMD': 'images/armenia-amd.svg',
      'BNB': 'images/bnb_logo.svg',
      'BTC': 'images/bitcoin-btc-logo.svg',
      'ETH': 'images/ethereum-eth.svg',
      'EUR': 'images/europe-flag.svg',
      'GBP': 'images/uk-gbr.svg',
      'RUB': 'images/russia-flag.svg',
      'USD': 'images/usa-flag.svg',
    };
    final String iconPath = icons[coin.name]!;

    return ListTile(
      leading: SvgPicture.asset(iconPath, width: 40),
      title: Text(
        coin.name,
        style: textBody,
      ),
      subtitle: Text(
        'coast: ${coin.price.toStringAsFixed(4)} ${coin.name}',
        style: subtitlText,
      ),
      trailing: const Icon(
        Icons.ssid_chart_sharp,
        size: 50,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin:', arguments: coin.name);
      },
    );
  }
}
