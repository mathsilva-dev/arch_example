import 'package:flutter/material.dart';

import '../../../../core/errors/currency_failure.dart';
import '../../../../injector.dart';
import '../repositories/currency_converter_repository.dart';
import '../states/currency_converter_states.dart';

class CurrencyConverterStore with ChangeNotifier {
  CurrencyConverterState get state => _state;
  CurrencyConverterState _state = CurrencyConverterLoadingState();

  Future<void> fetchCurrency() async {
    _state = CurrencyConverterLoadingState();
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
    final repository = injector.get<CurrencyConverterRepository>();
    var (entity, failure) = await repository.fetchCurrency();
    if (failure != null) {
      _state = CurrencyConverterErrorState(
          error: "Error is CurrencyFailure? ${failure is CurrencyFailure}");
      notifyListeners();
      return;
    }
    _state = CurrencyConverterLoadedState(currencyEntity: entity);
    notifyListeners();
  }
}
