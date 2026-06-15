import 'package:dio/dio.dart';

import 'stock_model.dart';

class YahooFinanceService {
  final Dio dio = Dio();

  Future<StockData> getStockData(String symbol) async {
    final response = await dio.get(
      'https://query1.finance.yahoo.com/v8/finance/chart/$symbol',
      queryParameters: {
        'modules': 'price,defaultKeyStatistics'
      },
    );

    final result =
    response.data['chart']['result'][0];
    print(response.data['chart']['result'][0]);
    final meta = result['meta'];
    return StockData(
      symbol: symbol,
      currentPrice:
      (meta['regularMarketPrice'] as num)
          .toDouble(),
      peRatio: 0,
      marketCap: 0,
    );
  }
}