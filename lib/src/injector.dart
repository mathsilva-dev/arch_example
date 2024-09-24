import 'package:auto_injector/auto_injector.dart';

import 'core/services/network/domain/network_service.dart';
import 'core/services/network/external/network_service_i.dart';
import 'modules/currency_converter/domain/repositories/currency_converter_repository.dart';
import 'modules/currency_converter/domain/stores/currency_converter_store.dart';
import 'modules/currency_converter/external/repositories/currency_converter_repository_i.dart';

final injector = AutoInjector();

void setupInjector() {
  injector.add<NetworkService>(NetworkServiceI.new);
  injector.addSingleton
      //
      <CurrencyConverterRepository>(CurrencyConverterRepositoryI.new);
  injector.add<CurrencyConverterStore>(
    CurrencyConverterStore.new,
    key: "currency_store",
  );

  injector.commit();
}
