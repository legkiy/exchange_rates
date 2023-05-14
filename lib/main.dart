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
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 34, 41, 61),
        primarySwatch: Colors.yellow,
        dividerTheme: const DividerThemeData(color: Colors.white12, space: 1),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
        ),
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
      home: const MyHomePage(title: 'Exchange Rates'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int activeIndex = -1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textBody = Theme.of(context).textTheme.bodyMedium;
    final subtitlText = Theme.of(context).textTheme.bodySmall;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Image.network(
            'https://pngimg.com/uploads/bitcoin/bitcoin_PNG7.png',
            height: 40,
          ),
          title: Text(
            'value $index',
            style: textBody,
          ),
          subtitle: Text(
            'coast: $_counter \$',
            style: subtitlText,
          ),
          trailing: const Icon(
            Icons.data_thresholding_outlined,
            size: 50,
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return Column(children: [
      //       GestureDetector(
      //         onTap: () => setState(() {
      //           if (activeIndex == index) {
      //             activeIndex = -1;
      //             return;
      //           }
      //           activeIndex = index;
      //         }),
      //         child: Container(
      //           height: 40,
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             color: Colors.blueGrey,
      //             borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(index == 0 ? 10 : 0),
      //               topRight: Radius.circular(index == 0 ? 10 : 0),
      //               bottomLeft: Radius.circular(index == 9
      //                   ? activeIndex == 9
      //                       ? 0
      //                       : 10
      //                   : 0),
      //               bottomRight: Radius.circular(index == 9
      //                   ? activeIndex == 9
      //                       ? 0
      //                       : 10
      //                   : 0),
      //             ),
      //           ),
      //           margin: const EdgeInsets.only(left: 10, right: 10),
      //           padding: const EdgeInsets.all(5),
      //           child: Text('data $index'),
      //         ),
      //       ),
      //       AnimatedContainer(
      //         duration: const Duration(
      //           milliseconds: 200,
      //         ),
      //         curve: Curves.easeInOut,
      //         width: double.infinity,
      //         height: activeIndex == index ? 200 : 0,
      //         margin: const EdgeInsets.only(left: 10, right: 10),
      //         decoration: const BoxDecoration(
      //             border: Border(
      //                 bottom: BorderSide(width: 1, color: Colors.black))),
      //         child: Text('body $_counter'),
      //       ),
      //     ]);
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
