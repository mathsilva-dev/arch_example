import 'package:arch_example/src/core/errors/currency_failure.dart';
import 'package:arch_example/src/injector.dart';
import 'package:arch_example/src/modules/currency_converter/domain/entities/currency_entity.dart';
import 'package:arch_example/src/modules/currency_converter/domain/repositories/currency_converter_repository.dart';
import 'package:arch_example/src/modules/currency_converter/domain/states/currency_converter_states.dart';
import 'package:arch_example/src/modules/currency_converter/domain/stores/currency_converter_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('fetch currency', () {
    test('Success', () async {
      CurrencyConverterStore store = CurrencyConverterStore();
      final repository = CurrencyConverterRepositoryMock();
      injector.replaceInstance<CurrencyConverterRepository>(repository);

      when(() => repository.fetchCurrency())
          .thenAnswer((_) async => (CurrencyEntity.empty(), null));

      await store.fetchCurrency();
      expect(
        store.state,
        CurrencyConverterLoadedState(currencyEntity: CurrencyEntity.empty()),
      );
    });

    test('Failure', () async {
      CurrencyConverterStore store = CurrencyConverterStore();
      final repository = CurrencyConverterRepositoryMock();
      injector.replaceInstance<CurrencyConverterRepository>(repository);

      when(() => repository.fetchCurrency()).thenAnswer((_) async => (
            CurrencyEntity.empty(),
            const CurrencyFailure('errorMessage', 'stackTrace')
          ));

      await store.fetchCurrency();
      expect(
        store.state,
        CurrencyConverterErrorState(error: 'Error is CurrencyFailure'),
      );
    });
  });
}

class CurrencyConverterRepositoryMock extends Mock
    implements CurrencyConverterRepository {}
