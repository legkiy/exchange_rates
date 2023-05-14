import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange Rates',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 34, 33, 48),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            iconTheme: IconThemeData(color: Colors.white)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 34, 41, 61),
        primarySwatch: Colors.yellow,
        dividerTheme: const DividerThemeData(color: Colors.white12, space: 1),
        listTileTheme: const ListTileThemeData(
            iconColor: Colors.white,
            contentPadding: EdgeInsets.only(left: 20, right: 20)),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            color: Color.fromARGB(255, 221, 221, 221),
            fontSize: 18,
          ),
        ),
        // useMaterial3: true,
      ),
      routes: {
        '/': (context) => const ExcahgeListScrean(),
        '/coin:': (context) => const CoinScrean()
      },
    );
  }
}

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
    final textBody = Theme.of(context).textTheme.bodyMedium;
    final subtitlText = Theme.of(context).textTheme.bodySmall;
    final randomCoast = Random().nextInt(10000) + 20;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Exchange Rates'),
      ),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            String coinName = index.toString();

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
                Icons.data_thresholding_outlined,
                size: 50,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/coin:', arguments: coinName);
              },
            );
          }),
    );
  }
}

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
    // if (args != null || args is! String) {
    // } else {
    //   return;
    // }
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
