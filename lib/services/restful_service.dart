import 'package:http/http.dart' as http;

class Restful {
  static getRequest(String url, {Map header}) => http.get(url, headers: header);

  static postRequest(String url, {Map header, body}) =>
      http.post(url, headers: header, body: body);
}

class Link {
  static const String homeUrl =
      'https://5f4766b895646700168d942a.mockapi.io/training/flutter';

  static linkWithHomeUrl(String endPoint) => homeUrl + endPoint;

  static student() => linkWithHomeUrl('/student');
}
