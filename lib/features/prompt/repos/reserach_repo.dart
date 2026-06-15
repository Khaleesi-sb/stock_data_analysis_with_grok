import '../services/grok_service.dart';
import '../services/yahoo_finance_service.dart';

class StockResearchRepository {
  StockResearchRepository();

  Future<String> research(String symbol) async {
    final YahooFinanceService yahoo = YahooFinanceService();
    final GrokService grok = GrokService();
    final stock =
    await yahoo.getStockData(symbol);

    return grok.analyzeStock(stock);
  }
}