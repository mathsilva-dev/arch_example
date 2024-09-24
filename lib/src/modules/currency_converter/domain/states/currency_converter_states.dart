import 'package:arch_example/src/modules/currency_converter/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CurrencyConverterState extends Equatable {}

class CurrencyConverterLoadingState extends CurrencyConverterState {
  @override
  List<Object?> get props => [];
}

class CurrencyConverterLoadedState extends CurrencyConverterState {
  final CurrencyEntity currencyEntity;

  CurrencyConverterLoadedState({required this.currencyEntity});

  @override
  List<Object?> get props => [currencyEntity];
}

class CurrencyConverterErrorState extends CurrencyConverterState {
  final String error;

  CurrencyConverterErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}
