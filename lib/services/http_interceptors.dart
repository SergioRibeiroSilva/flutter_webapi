import 'dart:math';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {

Logger logger = Logger();


  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v("${data.baseUrl}\nCabeçalhos: ${data.headers}\nCorpo:${data.body}");
    return data;
  }
  
  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {   
   logger.i("${data.url}\nCabeçalhos: ${data.headers}\nCorpo:${data.body}");
    return data;
  }  
  
}