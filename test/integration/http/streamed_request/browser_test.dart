@TestOn('browser')
library w_transport.test.integration.http.streamed_request.browser_test;

import 'dart:html';

import 'package:test/test.dart';
import 'package:w_transport/w_transport.dart';
import 'package:w_transport/w_transport_browser.dart';

import '../../../naming.dart';
import '../integration_config.dart';
import 'suite.dart';

void main() {
  var config = new HttpIntegrationConfig.browser();
  group(integrationHttpBrowser, () {
    setUp(() {
      configureWTransportForBrowser();
    });

    runStreamedRequestSuite(config);

    test('underlying HttpRequest configuration', () async {
      StreamedRequest request = new StreamedRequest()
        ..uri = config.reflectEndpointUri;
      request.configure((HttpRequest xhr) async {
        xhr.setRequestHeader('x-configured', 'true');
      });
      Response response = await request.get();
      expect(response.body.asJson()['headers']['x-configured'], equals('true'));
    });

    group('withCredentials', () {
      test('set to true (StreamedRequest)', () async {
        StreamedRequest request = new StreamedRequest()
          ..uri = config.pingEndpointUri
          ..withCredentials = true;
        request.configure((HttpRequest xhr) async {
          expect(xhr.withCredentials, isTrue);
        });
        await request.get();
      });

      test('set to false (StreamedRequest)', () async {
        StreamedRequest request = new StreamedRequest()
          ..uri = config.pingEndpointUri
          ..withCredentials = false;
        request.configure((HttpRequest xhr) async {
          expect(xhr.withCredentials, isFalse);
        });
        await request.get();
      });
    });
  });
}
