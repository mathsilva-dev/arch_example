import '../../../../core/errors/project_error.dart';
import '../entities/currency_entity.dart';

abstract class CurrencyConverterRepository {
  Future<(CurrencyEntity, ProjectError?)> fetchCurrency();
}
