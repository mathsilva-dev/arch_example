import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/currency_failure.dart';
import '../../../../core/errors/project_error.dart';
import '../../../../core/services/network/domain/network_service.dart';
import '../../../../injector.dart';
import '../../domain/entities/currency_entity.dart';
import '../../domain/repositories/currency_converter_repository.dart';
import '../adapters/currency_adapter.dart';
import '../models/currency_model.dart';

class CurrencyConverterRepositoryI implements CurrencyConverterRepository {
  @override
  Future<(CurrencyEntity, ProjectError?)> fetchCurrency() async {
    try {
      var networkService = injector.get<NetworkService>();
      var response = await networkService
          .get('https://economia.awesomeapi.com.br/last/USD-BRL');
      var model = CurrencyModel.fromJson(response.data['USDBRL']);
      return (CurrencyAdapter.fromModel(model), null);
    } on DioException catch (e, s) {
      debugPrint("error: $e | stack: $s");
      return (
        CurrencyEntity.empty(),
        CurrencyFailure(e.toString(), s.toString()),
      );
    }
  }
}
