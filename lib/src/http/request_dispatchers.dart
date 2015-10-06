library w_transport.src.http.request_dispatchers;

import 'dart:async';

import 'package:w_transport/src/http/response.dart';

/// Set of HTTP request dispatch methods that will be mixed in to each request
/// class. Provides methods for most standard HTTP requests as well as a generic
/// `send` method for sending requests with non-standard HTTP methods. These
/// request dispatch methods are supplied in two sets: one that returns a
/// response object with the entire body available synchronously, and a streamed
/// response object that provides asynchronous access to the response body.
abstract class RequestDispatchers {
  /// Send a DELETE request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] is given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<Response> delete({Map<String, String> headers, Uri uri});

  /// Send a GET request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<Response> get({Map<String, String> headers, Uri uri});

  /// Send a HEAD request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<Response> head({Map<String, String> headers, Uri uri});

  /// Send an OPTIONS request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<Response> options({Map<String, String> headers, Uri uri});

  /// Send a PATCH request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<Response> patch({body, Map<String, String> headers, Uri uri});

  /// Send a POST request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<Response> post({body, Map<String, String> headers, Uri uri});

  /// Send a PUT request.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<Response> put({body, Map<String, String> headers, Uri uri});

  /// Send an HTTP request with a custom [method].
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<Response> send(String method,
      {body, Map<String, String> headers, Uri uri});

  /// Send a DELETE request. The response will be streamed, meaning the body
  /// will be available asynchronously. This is useful for large response bodies
  /// or for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<StreamedResponse> streamDelete({Map<String, String> headers, Uri uri});

  /// Send a GET request. The response will be streamed, meaning the body will
  /// be available asynchronously. This is useful for large response bodies or
  /// for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<StreamedResponse> streamGet({Map<String, String> headers, Uri uri});

  /// Send a HEAD request. The response will be streamed, meaning the body will
  /// be available asynchronously. This is useful for large response bodies or
  /// for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<StreamedResponse> streamHead({Map<String, String> headers, Uri uri});

  /// Send an OPTIONS request. The response will be streamed, meaning the body
  /// will be available asynchronously. This is useful for large response bodies
  /// or for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  Future<StreamedResponse> streamOptions(
      {Map<String, String> headers, Uri uri});

  /// Send a PATCH request. The response will be streamed, meaning the body will
  /// be available asynchronously. This is useful for large response bodies or
  /// for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<StreamedResponse> streamPatch(
      {body, Map<String, String> headers, Uri uri});

  /// Send a POST request. The response will be streamed, meaning the body will
  /// be available asynchronously. This is useful for large response bodies or
  /// for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<StreamedResponse> streamPost(
      {body, Map<String, String> headers, Uri uri});

  /// Send a PUT request. The response will be streamed, meaning the body will
  /// be available asynchronously. This is useful for large response bodies or
  /// for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<StreamedResponse> streamPut(
      {body, Map<String, String> headers, Uri uri});

  /// Send an HTTP request with a custom [method]. The response will be
  /// streamed, meaning the body will be available asynchronously. This is
  /// useful for large response bodies or for proxies.
  ///
  /// If [uri] is given, the request will be sent to that exact uri. If [uri] is
  /// null, the uri on the [BaseRequest] will be used (and is thus required).
  ///
  /// If [headers] are given, they will be merged with the set of headers
  /// already defined on the [BaseRequest].
  ///
  /// If [body] is given, it must be of valid type for the type of request being
  /// sent. For example, if sending a JSON request using the [JsonRequest],
  /// [body] must be a JSON-encodable Map or List.
  Future<StreamedResponse> streamSend(String method,
      {body, Map<String, String> headers, Uri uri});
}
