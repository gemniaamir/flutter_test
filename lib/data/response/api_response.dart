import 'package:proctor/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  Status? status;
  T? response;

  ApiResponse(this.response, this.status, this.message);

  // Named constructor of class with their initializer value
  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed() : status = Status.completed;
  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "Message: $message\nResponse: $response\nStatus: $status";
  }
}
