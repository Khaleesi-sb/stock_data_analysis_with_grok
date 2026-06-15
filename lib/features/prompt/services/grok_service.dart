import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'stock_model.dart';

class GrokService {
  final Dio dio;

  GrokService()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.x.ai/v1',
      headers: {
        'Authorization': 'Bearer ${dotenv.env['XAI_API_KEY'] ?? ''}',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<String> analyzeStock(
      StockData stock,
      ) async {
    final prompt = '''
Analyze ${stock.symbol} stock.

Current Price: ₹${stock.currentPrice}

PE Ratio: ${stock.peRatio}

Market Cap: ${stock.marketCap}

Provide:
1. Business Overview
2. Strengths
3. Risks
4. Valuation Opinion
5. Investment Outlook

Do not provide direct financial advice.
''';

    final response = await dio.post(
      '/chat/completions',
      data: {
        "model": "grok-4",
        "messages": [
          {
            "role": "user",
            "content": prompt,
          }
        ]
      },
    );

    return response.data['choices'][0]
    ['message']['content'];
  }
}