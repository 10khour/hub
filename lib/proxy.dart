import 'dart:io';

class ProxiedHttpOverrides extends HttpOverrides {
  String host;
  String port;
  ProxiedHttpOverrides({required this.host, required this.port});

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $host:$port";
      };
  }
}
