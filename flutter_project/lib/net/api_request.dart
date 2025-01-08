import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_project/net/api_urls.dart';
import 'package:flutter_project/utils/log_utils.dart';

class RequestManager {
  // 单例方法
  static Dio? _dioInstance;
  static final BaseOptions _baseOptions = BaseOptions();

  // 初始化 Dio 实例和配置
  static void _initializeDio() {
    _baseOptions.baseUrl = ApiUrls.baseUrl;
    _baseOptions.contentType = "application/json";
    _baseOptions.connectTimeout = const Duration(seconds: 60);
    _baseOptions.sendTimeout = const Duration(seconds: 60);
    _baseOptions.receiveTimeout = const Duration(seconds: 60);
    _baseOptions.responseType = ResponseType.plain;

    if (_dioInstance == null) {
      _dioInstance = Dio(_baseOptions);
      _dioInstance!.interceptors.add(LoggerInterceptor());
    }
  }

  // 增加通用请求方法
  static Future<Response> request(String requestUrl, String method,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data}) {
    _initializeDio();
    try {
      if (method == 'POST') {
        return _dioInstance!.post(requestUrl,
            data: jsonEncode(data), queryParameters: queryParameters);
      } else if (method == 'GET') {
        return _dioInstance!.get(requestUrl, queryParameters: queryParameters);
      } else {
        throw UnsupportedError('Unsupported method: $method');
      }
    } catch (e) {
      // 处理用户状态无效的情况
      LoggerUtil.log('请求失败: $e', level: Level.error);
      rethrow;
    }
  }

  // 保留原方法作为便捷方法
  static Future<Response> postRequest(String requestUrl,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    return request(requestUrl, 'POST', data: data, queryParameters: params);
  }

  static Future<Response> getRequest(String requestUrl,
      {Map<String, dynamic>? queryParameters}) async {
    return request(requestUrl, 'GET', queryParameters: queryParameters);
  }

  static Future<Response> uploadFile(String requestUrl, File file,
      {Map<String, dynamic>? formData}) async {
    _initializeDio();
    try {
      FormData data = FormData.fromMap({
        ...?formData, // 可选的其他表单数据
        'file': await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      });

      return _dioInstance!.post(
        requestUrl,
        data: data,
        onSendProgress: (int sent, int total) {
          // 可以在这里处理上传进度
          LoggerUtil.log('Upload progress: $sent / $total', level: Level.info);
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}

// Define an interceptor that logs the requests and responses
class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    LoggerUtil.log('│————onError: ${options.method}  request => $requestPath',
        level: Level.error);
    LoggerUtil.log('│————onError: ${err.error}, Message: ${err.message}',
        level: Level.debug);
    LoggerUtil.log(
        '└──Dio网络请求结束─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────',
        level: Level.debug);

    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    LoggerUtil.log(
        '┌──Dio网络请求开始─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────');
    LoggerUtil.log('│————onRequest: ${options.method} request => $requestPath',
        level: Level.info);
    LoggerUtil.log('│————onRequest: Request Headers => ${options.headers}',
        level: Level.info);
    LoggerUtil.log('│————onRequest: Request Data => ${options.data}',
        level: Level.info); // Log formatted request data
    LoggerUtil.log(
        '│————onRequest: RequestParams => ${options.queryParameters}',
        level: Level.info);
    // Call the super class to continue handling the request
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the response status code and data
    LoggerUtil.log(
        '│————onResponse:  StatusCode: ${response.statusCode}, Data:  ${_prettyJsonEncode(response.data)}',
        level: Level.debug); // Log formatted response data
    LoggerUtil.log(
        '└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────');

    // Call the super class to continue handling the response
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format
  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}
