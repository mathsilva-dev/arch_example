import 'package:dio/dio.dart';

import '../domain/network_service.dart';

class NetworkServiceI implements NetworkService {
  late Dio _dio;
  NetworkServiceI() {
    _init();
  }

  void _init() {
    _dio = Dio();
  }

  @override
  Future get(String path) {
    return _dio.get(path);
  }
}
