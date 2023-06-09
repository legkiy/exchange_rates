import 'package:dio/dio.dart';
import './interfaces/coin_data_list.dart';

class GetExchangeData {
  Future<List<CoinDataListInterface>> getCoinstList(String valueName) async {
    String apiUrl =
        "https://api.currencyapi.com/v3/latest?apikey=B2Q9RBblI0PahqdprVKaIFOSAJyJT7EJt66WfUjx&currencies=RUB%2CEUR%2CUSD%2CGBP%2CAMD%2CBTC%2CBNB%2CETH&base_currency=$valueName";
    // String apiKey = 'cd17Q0AcUCGx8kzzpoIxC3AnGYhLFlwJ';
    final coinRes = await Dio()
        .get(apiUrl); //, options: Options(headers: {'apikey': apiKey}));
    final coinData = coinRes.data as Map<String, dynamic>;
    final coins = coinData['data'] as Map<String, dynamic>;

    final coinDataList = coins.entries.map((el) {
      return CoinDataListInterface(
        name: el.value['code'],
        price: el.value['value'],
      );
    }).toList();
    return coinDataList;
  }
}
