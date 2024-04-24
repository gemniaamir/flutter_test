import 'dart:io';

class AppException implements Exception {
  final String message;
  final String exceptionCode;

  AppException({required this.message, required this.exceptionCode});

  @override
  String toString() {
    return "$exceptionCode - $message";
  }
}

class InternetException extends AppException {
  InternetException({required exceptionMessage})
      : super(message: exceptionMessage, exceptionCode: 'Internet Exception');
}

class ConnectivityException extends SocketException {
  ConnectivityException({required exceptionMessage}) : super(exceptionMessage);
}
