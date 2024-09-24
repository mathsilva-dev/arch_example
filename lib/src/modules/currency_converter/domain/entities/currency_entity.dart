import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String fromCurrency;
  final String toCurrency;
  final String name;
  final double bid; // compra
  final double ask; // venda
  final int fetchDate;

  const CurrencyEntity({
    required this.fromCurrency,
    required this.toCurrency,
    required this.name,
    required this.bid,
    required this.ask,
    required this.fetchDate,
  });

  factory CurrencyEntity.empty() {
    return const CurrencyEntity(
      fromCurrency: '',
      toCurrency: '',
      name: '',
      bid: 0.0,
      ask: 0.0,
      fetchDate: 0,
    );
  }

  CurrencyEntity copyWith({
    String? fromCurrency,
    String? toCurrency,
    String? name,
    double? bid,
    double? ask,
    int? fetchDate,
  }) {
    return CurrencyEntity(
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      name: name ?? this.name,
      bid: bid ?? this.bid,
      ask: ask ?? this.ask,
      fetchDate: fetchDate ?? this.fetchDate,
    );
  }

  @override
  List<Object?> get props =>
      [fromCurrency, toCurrency, name, bid, ask, fetchDate];
}
