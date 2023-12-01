import 'package:ing_lab_app/api/api_config.dart';
import 'package:dio/dio.dart';

class ErrorResponse {
  bool isSuccessful;
  String message;
  int? statusCode;
  dynamic data;

  ErrorResponse(this.isSuccessful, this.message, this.statusCode, {this.data});
}

class Api {
  String endpoint = endPoint;

  Dio client() {
    return Dio(
      BaseOptions(
        baseUrl: endpoint,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  Future<ErrorResponse> getContacts() async {
    var response = await client().get(
      '/api/getContact',
      options: Options(
        validateStatus: (status) {
          return status! < 600;
        },
      ),
    );

    if (response.data['message'] == 'Successful') {
      return ErrorResponse(true, '', response.statusCode,
          data: response.data["data"]);
    } else {
      return ErrorResponse(
        false,
        response.data["message"],
        response.statusCode,
        data: response.data["data"],
      );
    }
  }
}
