import 'dart:io';

import 'package:get/get.dart';
import 'package:network_request_test/models/random_user_model.dart';

class Service extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://randomuser.me/';
    httpClient.defaultContentType = "json";
    httpClient.timeout = Duration(seconds: 8);
    httpClient.addResponseModifier((request, response) async {
      print(request.url);
      print(request.method);
      print(response.body);
      print(response.status.code);
    });
    httpClient.addRequestModifier((request) async {
      print(request.url);
      print(request.method);
      print(request.decoder);
      print(request.headers);
      return request;
    });

    super.onInit();
  }

  Future<RandomUserModel> getUser() async {
    var res = await get("api/");
    if (res.statusCode < 205) {
      return RandomUserModel.fromJson(res.body);
    } else {
      throw "Error Occurred";
    }
  }

  /// using mutualTls in flutter application
  Future<SecurityContext> get scTrial async {
    SecurityContext sc = SecurityContext(withTrustedRoots: false);

    /// load the key from your assets folder and pass into the [sc.usePrivateKeyBytes] function;
    sc.usePrivateKeyBytes([]);

    /// load the certificate from your assets folder and pass into the [sc.useCertificateChainBytes] function;
    sc.useCertificateChainBytes([]);
    mTlsGetConnectIntegration(sc);
    return sc;
  }

  mTlsGetConnectIntegration(SecurityContext sc) async {
    /// connect the certificate to all request made using the [connect] from the http client function.
    HttpClient connect = HttpClient(context: sc);
    connect.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      return true;
    };
    return connect;
  }
}
