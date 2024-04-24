abstract class BaseAPIRequest {
  Future<dynamic> getAPI(String url);
  Future<dynamic> postAPI(var data, String url);
}
