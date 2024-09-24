import 'project_error.dart';

final class CurrencyFailure implements ProjectError {
  final String errorMessage;
  final String stackTrace;
  const CurrencyFailure(this.errorMessage, this.stackTrace);
}
