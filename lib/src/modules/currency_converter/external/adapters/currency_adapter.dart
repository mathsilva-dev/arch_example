import 'package:intl/intl.dart';

import '../../domain/entities/currency_entity.dart';
import '../models/currency_model.dart';

abstract class CurrencyAdapter {
  static CurrencyEntity fromModel(CurrencyModel model) {
    return CurrencyEntity(
      fromCurrency: model.code,
      toCurrency: model.codeIn,
      name: model.name,
      bid: model.bid,
      ask: model.ask,
      fetchDate: int.parse(model.timestamp),
    );
  }

  static CurrencyModel fromEntity(CurrencyEntity entity) {
    return CurrencyModel(
      code: entity.fromCurrency,
      codeIn: entity.toCurrency,
      name: entity.name,
      high: 0.0,
      low: 0.0,
      varBid: 0.0,
      pctChange: 0.0,
      bid: entity.bid,
      ask: entity.ask,
      timestamp: entity.fetchDate.toString(),
      createDate: DateFormat.yMMMMd()
          .format(DateTime.fromMillisecondsSinceEpoch(entity.fetchDate)),
    );
  }
}
