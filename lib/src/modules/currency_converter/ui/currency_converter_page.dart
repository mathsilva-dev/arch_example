import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/routes.dart';
import '../../../injector.dart';
import '../domain/states/currency_converter_states.dart';
import '../domain/stores/currency_converter_store.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  var store = injector.get<CurrencyConverterStore>(key: "currency_store");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.fetchCurrency();
    });
  }

  @override
  void dispose() {
    super.dispose();
    injector.disposeInjectorByTag("currency_store");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Page')),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          var state = store.state;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is CurrencyConverterLoadingState) ...[
                const Center(child: CircularProgressIndicator()),
              ] else if (state is CurrencyConverterErrorState) ...[
                Center(child: Text(state.error)),
              ] else if (state is CurrencyConverterLoadedState) ...[
                Center(
                  child: Column(
                    children: [
                      Text('Currency: ${state.currencyEntity.fromCurrency}'),
                      Text('Relative to: ${state.currencyEntity.name}'),
                      Text('BID: ${state.currencyEntity.bid}'),
                      ElevatedButton(
                        onPressed: () {
                          if (context.canPop()) {
                            context.pop();
                            return;
                          }
                          context.go(Routes.home);
                        },
                        child: const Text('Go Back'),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
