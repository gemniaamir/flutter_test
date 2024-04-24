import 'package:get/get.dart';
import 'package:proctor/view/dashboard.dart';


class RoutesHelper {
  ///
  /// Name of Get Routes
  static const String _dashboard = '/dashboard';

  ///
  /// Getters for Routes
  static String get dashboard => _dashboard;

  ///
  /// Array of App Pages for Navigation
  static List<GetPage> pages = [
    GetPage(
        name: dashboard,
        page: () {
          return const Dashboard();
        }),
  ];
}
