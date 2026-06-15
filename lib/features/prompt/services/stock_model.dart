class StockData {
  final String symbol;
  final double currentPrice;
  final double peRatio;
  final double marketCap;

  StockData({
    required this.symbol,
    required this.currentPrice,
    required this.peRatio,
    required this.marketCap,
  });
}