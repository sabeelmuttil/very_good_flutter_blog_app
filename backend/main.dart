import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  final flavor = Platform.environment['FLAVOR'];
  if (flavor == 'DEV') {
    return serve(handler, ip, port, poweredByHeader: null);
  }
  const customStaticDocumentPath = 'docs';
  final cascade = Cascade()
      .add(createStaticFileHandler(path: customStaticDocumentPath))
      .add(handler);
  return serve(cascade.handler, ip, port, poweredByHeader: null);
}
