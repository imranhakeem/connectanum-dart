import 'dart:collection';
import 'dart:typed_data';

import 'package:connectanum/connectanum.dart';
import 'package:connectanum/src/message/authenticate.dart';
import 'package:connectanum/src/message/error.dart';
import 'package:connectanum/src/message/hello.dart';
import 'package:connectanum/src/message/message_types.dart';
import 'package:connectanum/src/message/welcome.dart';
import 'package:connectanum/src/serializer/cbor/serializer.dart';
import 'package:test/test.dart';

void main() {
  var serializer = Serializer();
  group('serialize', () {
    test('Hello', () {
      expect(
          serializer.serialize(Hello('my.realm', Details.forHello())),
          equals(Uint8List.fromList([131, 1, 104, 109, 121, 46, 114, 101, 97, 108, 109, 161, 101, 114, 111, 108, 101, 115, 164, 102, 99, 97, 108, 108, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 165, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 102, 99, 97, 108, 108, 101, 101, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 168, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 112, 99, 97, 108, 108, 95, 116, 114, 117, 115, 116, 108, 101, 118, 101, 108, 115, 244, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 115, 115, 104, 97, 114, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 106, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 165, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 244, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 119, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 95, 114, 101, 118, 111, 99, 97, 116, 105, 111, 110, 245, 105, 112, 117, 98, 108, 105, 115, 104, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 164, 120, 24, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 120, 29, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 95, 98, 108, 97, 99, 107, 119, 104, 105, 116, 101, 95, 108, 105, 115, 116, 105, 110, 103, 245, 115, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 101, 120, 99, 108, 117, 115, 105, 111, 110, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245]))
      );
      expect(
          serializer.serialize(Hello(null, Details.forHello())),
          equals(Uint8List.fromList([131, 1, 246, 161, 101, 114, 111, 108, 101, 115, 164, 102, 99, 97, 108, 108, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 165, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 102, 99, 97, 108, 108, 101, 101, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 168, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 112, 99, 97, 108, 108, 95, 116, 114, 117, 115, 116, 108, 101, 118, 101, 108, 115, 244, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 115, 115, 104, 97, 114, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 106, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 165, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 244, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 119, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 95, 114, 101, 118, 111, 99, 97, 116, 105, 111, 110, 245, 105, 112, 117, 98, 108, 105, 115, 104, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 164, 120, 24, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 120, 29, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 95, 98, 108, 97, 99, 107, 119, 104, 105, 116, 101, 95, 108, 105, 115, 116, 105, 110, 103, 245, 115, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 101, 120, 99, 108, 117, 115, 105, 111, 110, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245]))
      );
    });
    test('Hello with auth information', () {
      var authHello = Hello('my.realm', Details.forHello());
      authHello.details.authid = 'Richard';
      authHello.details.authmethods = ['WAMP-CRA'];
      authHello.details.authextra = HashMap();
      authHello.details.authextra!['nonce'] = 'egVDf3DMJh0=';
      authHello.details.authextra!['channel_binding'] = null;
      expect(
          serializer.serialize(authHello),
          equals(Uint8List.fromList([131, 1, 104, 109, 121, 46, 114, 101, 97, 108, 109, 164, 101, 114, 111, 108, 101, 115, 164, 102, 99, 97, 108, 108, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 165, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 102, 99, 97, 108, 108, 101, 101, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 168, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 112, 99, 97, 108, 108, 95, 116, 114, 117, 115, 116, 108, 101, 118, 101, 108, 115, 244, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 115, 115, 104, 97, 114, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 106, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 165, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 244, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 119, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 95, 114, 101, 118, 111, 99, 97, 116, 105, 111, 110, 245, 105, 112, 117, 98, 108, 105, 115, 104, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 164, 120, 24, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 120, 29, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 95, 98, 108, 97, 99, 107, 119, 104, 105, 116, 101, 95, 108, 105, 115, 116, 105, 110, 103, 245, 115, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 101, 120, 99, 108, 117, 115, 105, 111, 110, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 102, 97, 117, 116, 104, 105, 100, 103, 82, 105, 99, 104, 97, 114, 100, 107, 97, 117, 116, 104, 109, 101, 116, 104, 111, 100, 115, 129, 104, 87, 65, 77, 80, 45, 67, 82, 65, 105, 97, 117, 116, 104, 101, 120, 116, 114, 97, 162, 111, 99, 104, 97, 110, 110, 101, 108, 95, 98, 105, 110, 100, 105, 110, 103, 246, 101, 110, 111, 110, 99, 101, 108, 101, 103, 86, 68, 102, 51, 68, 77, 74, 104, 48, 61]))
      );
    });
    test('Authenticate', () {
      expect(
          serializer.serialize(Authenticate()),
          equals(Uint8List.fromList([131, 5, 96, 160]))
      );
      expect(
          serializer.serialize(Authenticate.signature('someSignature')),
          equals(Uint8List.fromList([131, 5, 109, 115, 111, 109, 101, 83, 105, 103, 110, 97, 116, 117, 114, 101, 160]))
      );
      var authenticate = Authenticate.signature('someSignature');
      authenticate.extra = HashMap<String, Object?>();
      authenticate.extra!['nonce'] = 'abc';
      expect(
          serializer.serialize(authenticate),
          equals(Uint8List.fromList([131, 5, 109, 115, 111, 109, 101, 83, 105, 103, 110, 97, 116, 117, 114, 101, 161, 101, 110, 111, 110, 99, 101, 99, 97, 98, 99]))
      );
    });
    test('Register', () {
      expect(
          serializer.serialize(Register(25349185, 'com.myapp.myprocedure1')),
          equals(Uint8List.fromList([132, 24, 64, 26, 1, 130, 204, 65, 160, 118, 99, 111, 109, 46, 109, 121, 97, 112, 112, 46, 109, 121, 112, 114, 111, 99, 101, 100, 117, 114, 101, 49]))
      );
      expect(
          serializer.serialize(Register(25349185, 'com.myapp.myprocedure1',
              options: RegisterOptions(
                  disclose_caller: true,
                  invoke: RegisterOptions.INVOCATION_POLICY_RANDOM,
                  match: RegisterOptions.MATCH_PREFIX))),
          equals(Uint8List.fromList([132, 24, 64, 26, 1, 130, 204, 65, 163, 101, 109, 97, 116, 99, 104, 102, 112, 114, 101, 102, 105, 120, 111, 100, 105, 115, 99, 108, 111, 115, 101, 95, 99, 97, 108, 108, 101, 114, 245, 102, 105, 110, 118, 111, 107, 101, 102, 114, 97, 110, 100, 111, 109, 118, 99, 111, 109, 46, 109, 121, 97, 112, 112, 46, 109, 121, 112, 114, 111, 99, 101, 100, 117, 114, 101, 49]))
      );
      expect(
          serializer.serialize(Register(
              25349185, 'com.myapp.myprocedure2',
              options: RegisterOptions(disclose_caller: false))),
          equals(Uint8List.fromList([132, 24, 64, 26, 1, 130, 204, 65, 161, 111, 100, 105, 115, 99, 108, 111, 115, 101, 95, 99, 97, 108, 108, 101, 114, 244, 118, 99, 111, 109, 46, 109, 121, 97, 112, 112, 46, 109, 121, 112, 114, 111, 99, 101, 100, 117, 114, 101, 50]))
      );
    });
    test('Unregister', () {
      expect(
          serializer.serialize(Unregister(25349185, 127981236)),
          equals(Uint8List.fromList([131, 24, 66, 26, 1, 130, 204, 65, 26, 7, 160, 214, 180]))
      );
    });
  });
  group('deserialize', () {
    test('Abort', () {
      var abort = serializer.deserialize(Uint8List.fromList([131, 3, 161, 103, 109, 101, 115, 115, 97, 103, 101, 120, 53, 82, 101, 99, 101, 105, 118, 101, 100, 32, 72, 69, 76, 76, 79, 32, 109, 101, 115, 115, 97, 103, 101, 32, 97, 102, 116, 101, 114, 32, 115, 101, 115, 115, 105, 111, 110, 32, 119, 97, 115, 32, 101, 115, 116, 97, 98, 108, 105, 115, 104, 101, 100, 46, 120, 29, 119, 97, 109, 112, 46, 101, 114, 114, 111, 114, 46, 112, 114, 111, 116, 111, 99, 111, 108, 95, 118, 105, 111, 108, 97, 116, 105, 111, 110])
      ) as Abort;
      expect(abort, isNotNull);
      expect(abort.id, equals(MessageTypes.CODE_ABORT));
      expect(abort.message!.message,
          equals('Received HELLO message after session was established.'));
      expect(abort.reason, equals(Error.PROTOCOL_VIOLATION));
    });
    test('Challenge', () {
      var challenge = serializer.deserialize(
          Uint8List.fromList([131, 4, 103, 119, 97, 109, 112, 99, 114, 97, 164, 105, 99, 104, 97, 108, 108, 101, 110, 103, 101, 120, 172, 123, 34, 97, 117, 116, 104, 105, 100, 34, 58, 34, 82, 105, 99, 104, 105, 34, 44, 34, 97, 117, 116, 104, 114, 111, 108, 101, 34, 58, 34, 97, 100, 109, 105, 110, 34, 44, 34, 97, 117, 116, 104, 109, 101, 116, 104, 111, 100, 34, 58, 34, 119, 97, 109, 112, 99, 114, 97, 34, 44, 34, 97, 117, 116, 104, 112, 114, 111, 118, 105, 100, 101, 114, 34, 58, 34, 115, 101, 114, 118, 101, 114, 34, 44, 34, 110, 111, 110, 99, 101, 34, 58, 34, 53, 54, 51, 54, 49, 49, 55, 53, 54, 56, 55, 54, 56, 49, 50, 50, 34, 44, 34, 116, 105, 109, 101, 115, 116, 97, 109, 112, 34, 58, 34, 50, 48, 49, 56, 45, 48, 51, 45, 49, 54, 84, 48, 55, 58, 50, 57, 90, 34, 44, 34, 115, 101, 115, 115, 105, 111, 110, 34, 58, 34, 53, 55, 54, 56, 53, 48, 49, 48, 57, 57, 49, 51, 48, 56, 51, 54, 34, 125, 100, 115, 97, 108, 116, 114, 102, 104, 104, 105, 50, 57, 48, 102, 104, 55, 194, 167, 41, 71, 81, 41, 71, 41, 102, 107, 101, 121, 108, 101, 110, 24, 35, 106, 105, 116, 101, 114, 97, 116, 105, 111, 110, 115, 25, 1, 154])
      ) as Challenge;
      expect(challenge, isNotNull);
      expect(challenge.id, equals(MessageTypes.CODE_CHALLENGE));
      expect(challenge.authMethod, equals('wampcra'));
      expect(
          challenge.extra.challenge,
          equals(
              '{\"authid\":\"Richi\",\"authrole\":\"admin\",\"authmethod\":\"wampcra\",\"authprovider\":\"server\",\"nonce\":\"5636117568768122\",\"timestamp\":\"2018-03-16T07:29Z\",\"session\":\"5768501099130836\"}'));
      expect(challenge.extra.salt, equals('fhhi290fh7§)GQ)G)'));
      expect(challenge.extra.keylen, equals(35));
      expect(challenge.extra.iterations, equals(410));
    });
    test('Welcome', () {
      var welcome = serializer.deserialize(
          Uint8List.fromList([131, 2, 26, 0, 1, 182, 105, 165, 102, 97, 117, 116, 104, 105, 100, 101, 82, 105, 99, 104, 105, 104, 97, 117, 116, 104, 114, 111, 108, 101, 101, 97, 100, 109, 105, 110, 106, 97, 117, 116, 104, 109, 101, 116, 104, 111, 100, 103, 119, 97, 109, 112, 99, 114, 97, 108, 97, 117, 116, 104, 112, 114, 111, 118, 105, 100, 101, 114, 104, 100, 97, 116, 97, 98, 97, 115, 101, 101, 114, 111, 108, 101, 115, 162, 102, 98, 114, 111, 107, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 168, 120, 24, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 244, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 244, 117, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 244, 120, 29, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 95, 98, 108, 97, 99, 107, 119, 104, 105, 116, 101, 95, 108, 105, 115, 116, 105, 110, 103, 244, 112, 115, 101, 115, 115, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 244, 115, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 101, 120, 99, 108, 117, 115, 105, 111, 110, 244, 109, 101, 118, 101, 110, 116, 95, 104, 105, 115, 116, 111, 114, 121, 244, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 244, 102, 100, 101, 97, 108, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 170, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 244, 112, 99, 97, 108, 108, 95, 116, 114, 117, 115, 116, 108, 101, 118, 101, 108, 115, 244, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 117, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 244, 115, 115, 104, 97, 114, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 244, 112, 115, 101, 115, 115, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 244, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 244, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 244, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 244, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 244])
      ) as Welcome;
      expect(welcome, isNotNull);
      expect(welcome.id, equals(MessageTypes.CODE_WELCOME));
      expect(welcome.sessionId, equals(112233));
      expect(welcome.details.authid, equals('Richi'));
      expect(welcome.details.authrole, equals('admin'));
      expect(welcome.details.authmethod, equals('wampcra'));
      expect(welcome.details.authprovider, equals('database'));
      expect(welcome.details.roles, isNotNull);
      expect(welcome.details.roles!.broker, isNotNull);
      expect(welcome.details.roles!.broker!.features, isNotNull);
      expect(welcome.details.roles!.broker!.features!.payload_transparency,
          isFalse);
      expect(welcome.details.roles!.broker!.features!.event_history, isFalse);
      expect(
          welcome.details.roles!.broker!.features!.pattern_based_subscription,
          isFalse);
      expect(welcome.details.roles!.broker!.features!.publication_trustlevels,
          isFalse);
      expect(welcome.details.roles!.broker!.features!.publisher_exclusion,
          isFalse);
      expect(welcome.details.roles!.broker!.features!.publisher_identification,
          isFalse);
      expect(
          welcome.details.roles!.broker!.features!.session_meta_api, isFalse);
      expect(
          welcome
              .details.roles!.broker!.features!.subscriber_blackwhite_listing,
          isFalse);
      expect(welcome.details.roles!.broker!.features!.subscription_meta_api,
          isFalse);
      expect(welcome.details.roles!.dealer, isNotNull);
      expect(welcome.details.roles!.dealer!.features, isNotNull);
      expect(welcome.details.roles!.dealer!.features!.payload_transparency,
          isFalse);
      expect(
          welcome.details.roles!.dealer!.features!.session_meta_api, isFalse);
      expect(welcome.details.roles!.dealer!.features!.progressive_call_results,
          isFalse);
      expect(welcome.details.roles!.dealer!.features!.caller_identification,
          isFalse);
      expect(welcome.details.roles!.dealer!.features!.call_timeout, isFalse);
      expect(welcome.details.roles!.dealer!.features!.call_canceling, isFalse);
      expect(
          welcome.details.roles!.dealer!.features!.call_trustlevels, isFalse);
      expect(
          welcome.details.roles!.dealer!.features!.pattern_based_registration,
          isFalse);
      expect(welcome.details.roles!.dealer!.features!.registration_meta_api,
          isFalse);
      expect(welcome.details.roles!.dealer!.features!.shared_registration,
          isFalse);

      welcome = serializer.deserialize(
          Uint8List.fromList([131, 2, 26, 0, 1, 182, 105, 165, 102, 97, 117, 116, 104, 105, 100, 101, 82, 105, 99, 104, 105, 104, 97, 117, 116, 104, 114, 111, 108, 101, 101, 97, 100, 109, 105, 110, 106, 97, 117, 116, 104, 109, 101, 116, 104, 111, 100, 103, 119, 97, 109, 112, 99, 114, 97, 108, 97, 117, 116, 104, 112, 114, 111, 118, 105, 100, 101, 114, 104, 100, 97, 116, 97, 98, 97, 115, 101, 101, 114, 111, 108, 101, 115, 162, 102, 98, 114, 111, 107, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 168, 120, 24, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 245, 117, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 245, 120, 29, 115, 117, 98, 115, 99, 114, 105, 98, 101, 114, 95, 98, 108, 97, 99, 107, 119, 104, 105, 116, 101, 95, 108, 105, 115, 116, 105, 110, 103, 245, 112, 115, 101, 115, 115, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 245, 115, 112, 117, 98, 108, 105, 115, 104, 101, 114, 95, 101, 120, 99, 108, 117, 115, 105, 111, 110, 245, 109, 101, 118, 101, 110, 116, 95, 104, 105, 115, 116, 111, 114, 121, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245, 102, 100, 101, 97, 108, 101, 114, 161, 104, 102, 101, 97, 116, 117, 114, 101, 115, 170, 117, 99, 97, 108, 108, 101, 114, 95, 105, 100, 101, 110, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110, 245, 112, 99, 97, 108, 108, 95, 116, 114, 117, 115, 116, 108, 101, 118, 101, 108, 115, 245, 120, 26, 112, 97, 116, 116, 101, 114, 110, 95, 98, 97, 115, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 245, 117, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 245, 115, 115, 104, 97, 114, 101, 100, 95, 114, 101, 103, 105, 115, 116, 114, 97, 116, 105, 111, 110, 245, 112, 115, 101, 115, 115, 105, 111, 110, 95, 109, 101, 116, 97, 95, 97, 112, 105, 245, 108, 99, 97, 108, 108, 95, 116, 105, 109, 101, 111, 117, 116, 245, 110, 99, 97, 108, 108, 95, 99, 97, 110, 99, 101, 108, 105, 110, 103, 245, 120, 24, 112, 114, 111, 103, 114, 101, 115, 115, 105, 118, 101, 95, 99, 97, 108, 108, 95, 114, 101, 115, 117, 108, 116, 115, 245, 116, 112, 97, 121, 108, 111, 97, 100, 95, 116, 114, 97, 110, 115, 112, 97, 114, 101, 110, 99, 121, 245])
      ) as Welcome;
      expect(welcome, isNotNull);
      expect(welcome.id, equals(MessageTypes.CODE_WELCOME));
      expect(welcome.sessionId, equals(112233));
      expect(welcome.details.authid, equals('Richi'));
      expect(welcome.details.authrole, equals('admin'));
      expect(welcome.details.authmethod, equals('wampcra'));
      expect(welcome.details.authprovider, equals('database'));
      expect(welcome.details.roles, isNotNull);
      expect(welcome.details.roles!.broker, isNotNull);
      expect(welcome.details.roles!.broker!.features, isNotNull);
      expect(welcome.details.roles!.broker!.features!.payload_transparency,
          isTrue);
      expect(welcome.details.roles!.broker!.features!.event_history, isTrue);
      expect(
          welcome.details.roles!.broker!.features!.pattern_based_subscription,
          isTrue);
      expect(welcome.details.roles!.broker!.features!.publication_trustlevels,
          isFalse); // not send
      expect(
          welcome.details.roles!.broker!.features!.publisher_exclusion, isTrue);
      expect(welcome.details.roles!.broker!.features!.publisher_identification,
          isTrue);
      expect(welcome.details.roles!.broker!.features!.session_meta_api, isTrue);
      expect(
          welcome
              .details.roles!.broker!.features!.subscriber_blackwhite_listing,
          isTrue);
      expect(welcome.details.roles!.broker!.features!.subscription_meta_api,
          isTrue);
      expect(welcome.details.roles!.dealer, isNotNull);
      expect(welcome.details.roles!.dealer!.features, isNotNull);
      expect(welcome.details.roles!.dealer!.features!.payload_transparency,
          isTrue);
      expect(welcome.details.roles!.dealer!.features!.session_meta_api, isTrue);
      expect(welcome.details.roles!.dealer!.features!.progressive_call_results,
          isTrue);
      expect(welcome.details.roles!.dealer!.features!.caller_identification,
          isTrue);
      expect(welcome.details.roles!.dealer!.features!.call_timeout, isTrue);
      expect(welcome.details.roles!.dealer!.features!.call_canceling, isTrue);
      expect(welcome.details.roles!.dealer!.features!.call_trustlevels, isTrue);
      expect(
          welcome.details.roles!.dealer!.features!.pattern_based_registration,
          isTrue);
      expect(welcome.details.roles!.dealer!.features!.registration_meta_api,
          isTrue);
      expect(
          welcome.details.roles!.dealer!.features!.shared_registration, isTrue);
    });
    test('Registered', () {
      var registered = serializer
          .deserialize(Uint8List.fromList([131, 24, 65, 26, 1, 130, 204, 65, 26, 125, 94, 81, 104])) as Registered;
      expect(registered, isNotNull);
      expect(registered.id, equals(MessageTypes.CODE_REGISTERED));
      expect(registered.registerRequestId, equals(25349185));
      expect(registered.registrationId, equals(2103333224));
    });
    test('Unregistered', () {
      var unregistered =
      serializer.deserialize(Uint8List.fromList([130, 24, 67, 26, 47, 6, 4, 170])) as Unregistered;
      expect(unregistered, isNotNull);
      expect(unregistered.id, equals(MessageTypes.CODE_UNREGISTERED));
      expect(unregistered.unregisterRequestId, equals(788923562));
    });
    test('Invocation', () {
      var invocation = serializer
          .deserialize(Uint8List.fromList([132, 24, 68, 26, 0, 93, 143, 77, 26, 0, 149, 229, 38, 160])) as Invocation;
      expect(invocation, isNotNull);
      expect(invocation.id, equals(MessageTypes.CODE_INVOCATION));
      expect(invocation.requestId, equals(6131533));
      expect(invocation.registrationId, equals(9823526));
      expect(invocation.details, isNotNull);
      expect(invocation.details.receive_progress, isNull);
      expect(invocation.details.caller, isNull);
      expect(invocation.details.procedure, isNull);
      expect(invocation.arguments, isNull);
      expect(invocation.argumentsKeywords, isNull);

      invocation = serializer.deserialize(Uint8List.fromList([133, 24, 68, 26, 0, 93, 143, 77, 26, 0, 149, 229, 39, 160, 129, 109, 72, 101, 108, 108, 111, 44, 32, 119, 111, 114, 108, 100, 33])) as Invocation;
      expect(invocation, isNotNull);
      expect(invocation.id, equals(MessageTypes.CODE_INVOCATION));
      expect(invocation.requestId, equals(6131533));
      expect(invocation.registrationId, equals(9823527));
      expect(invocation.details, isNotNull);
      expect(invocation.details.receive_progress, isNull);
      expect(invocation.details.caller, isNull);
      expect(invocation.details.procedure, isNull);
      expect(invocation.arguments![0], equals('Hello, world!'));
      expect(invocation.argumentsKeywords, isNull);

      invocation = serializer.deserialize(Uint8List.fromList([134, 24, 68, 26, 0, 93, 143, 77, 26, 0, 149, 229, 41, 160, 129, 102, 106, 111, 104, 110, 110, 121, 162, 105, 102, 105, 114, 115, 116, 110, 97, 109, 101, 100, 74, 111, 104, 110, 103, 115, 117, 114, 110, 97, 109, 101, 99, 68, 111, 101]))
      as Invocation;
      expect(invocation, isNotNull);
      expect(invocation.id, equals(MessageTypes.CODE_INVOCATION));
      expect(invocation.requestId, equals(6131533));
      expect(invocation.registrationId, equals(9823529));
      expect(invocation.details, isNotNull);
      expect(invocation.details.receive_progress, isNull);
      expect(invocation.details.caller, isNull);
      expect(invocation.details.procedure, isNull);
      expect(invocation.arguments![0], equals('johnny'));
      expect(invocation.argumentsKeywords!['firstname'], equals('John'));
      expect(invocation.argumentsKeywords!['surname'], equals('Doe'));

      invocation = serializer.deserialize(Uint8List.fromList([134, 24, 68, 26, 0, 93, 143, 77, 26, 0, 149, 229, 41, 163, 112, 114, 101, 99, 101, 105, 118, 101, 95, 112, 114, 111, 103, 114, 101, 115, 115, 245, 102, 99, 97, 108, 108, 101, 114, 25, 51, 67, 105, 112, 114, 111, 99, 101, 100, 117, 114, 101, 112, 109, 121, 46, 112, 114, 111, 99, 101, 100, 117, 114, 101, 46, 99, 111, 109, 129, 102, 106, 111, 104, 110, 110, 121, 162, 105, 102, 105, 114, 115, 116, 110, 97, 109, 101, 100, 74, 111, 104, 110, 103, 115, 117, 114, 110, 97, 109, 101, 99, 68, 111, 101]))
      as Invocation;
      expect(invocation, isNotNull);
      expect(invocation.id, equals(MessageTypes.CODE_INVOCATION));
      expect(invocation.requestId, equals(6131533));
      expect(invocation.registrationId, equals(9823529));
      expect(invocation.details, isNotNull);
      expect(invocation.details.receive_progress, isTrue);
      expect(invocation.details.caller, equals(13123));
      expect(invocation.details.procedure, equals('my.procedure.com'));
      expect(invocation.arguments![0], equals('johnny'));
      expect(invocation.argumentsKeywords!['firstname'], equals('John'));
      expect(invocation.argumentsKeywords!['surname'], equals('Doe'));
    });
    test('Result', () {
      var result =
      serializer.deserialize(Uint8List.fromList([131, 24, 50, 26, 0, 119, 59, 247, 160])) as Result;
      expect(result, isNotNull);
      expect(result.id, equals(MessageTypes.CODE_RESULT));
      expect(result.callRequestId, equals(7814135));
      expect(result.details, isNotNull);
      expect(result.details.progress, isNull);
      expect(result.arguments, isNull);
      expect(result.argumentsKeywords, isNull);

      result =
      serializer.deserialize(Uint8List.fromList([132, 24, 50, 26, 0, 119, 59, 247, 160, 129, 24, 30])) as Result;
      expect(result, isNotNull);
      expect(result.id, equals(MessageTypes.CODE_RESULT));
      expect(result.callRequestId, equals(7814135));
      expect(result.details, isNotNull);
      expect(result.details.progress, isNull);
      expect(result.arguments![0], equals(30));
      expect(result.argumentsKeywords, isNull);

      result = serializer.deserialize(Uint8List.fromList([133, 24, 50, 26, 0, 93, 143, 77, 160, 129, 102, 106, 111, 104, 110, 110, 121, 162, 102, 117, 115, 101, 114, 105, 100, 24, 123, 101, 107, 97, 114, 109, 97, 10])) as Result;
      expect(result, isNotNull);
      expect(result.id, equals(MessageTypes.CODE_RESULT));
      expect(result.callRequestId, equals(6131533));
      expect(result.details, isNotNull);
      expect(result.details.progress, isNull);
      expect(result.arguments![0], equals('johnny'));
      expect(result.argumentsKeywords!['userid'], equals(123));
      expect(result.argumentsKeywords!['karma'], equals(10));

      result = serializer.deserialize(Uint8List.fromList([133, 24, 50, 26, 0, 93, 143, 77, 161, 104, 112, 114, 111, 103, 114, 101, 115, 115, 245, 129, 102, 106, 111, 104, 110, 110, 121, 162, 105, 102, 105, 114, 115, 116, 110, 97, 109, 101, 100, 74, 111, 104, 110, 103, 115, 117, 114, 110, 97, 109, 101, 99, 68, 111, 101])) as Result;
      expect(result, isNotNull);
      expect(result.id, equals(MessageTypes.CODE_RESULT));
      expect(result.callRequestId, equals(6131533));
      expect(result.details, isNotNull);
      expect(result.details.progress, isTrue);
      expect(result.arguments![0], equals('johnny'));
      expect(result.argumentsKeywords!['firstname'], equals('John'));
      expect(result.argumentsKeywords!['surname'], equals('Doe'));
    });
    // PUB / SUB
    test('Subscribed', () {
      var subscribed = serializer.deserialize(Uint8List.fromList([131, 24, 33, 26, 42, 140, 105, 241, 27, 0, 0, 0, 1, 72, 143, 65, 219])) as Subscribed;
      expect(subscribed, isNotNull);
      expect(subscribed.id, equals(MessageTypes.CODE_SUBSCRIBED));
      expect(subscribed.subscribeRequestId, equals(713845233));
      expect(subscribed.subscriptionId, equals(5512315355));
    });
    test('Unsubscribed', () {
      var unsubscribed = serializer.deserialize(Uint8List.fromList([130, 24, 35, 26, 5, 22, 71, 189])) as Unsubscribed;
      expect(unsubscribed, isNotNull);
      expect(unsubscribed.id, equals(MessageTypes.CODE_UNSUBSCRIBED));
      expect(unsubscribed.unsubscribeRequestId, equals(85346237));
      expect(unsubscribed.details, isNull);

      unsubscribed = serializer.deserialize(Uint8List.fromList([131, 24, 35, 26, 5, 22, 71, 189, 162, 108, 115, 117, 98, 115, 99, 114, 105, 112, 116, 105, 111, 110, 26, 0, 1, 225, 186, 102, 114, 101, 97, 115, 111, 110, 120, 24, 119, 97, 109, 112, 46, 97, 117, 116, 104, 101, 110, 116, 105, 99, 97, 116, 105, 111, 110, 46, 108, 111, 115, 116])) as Unsubscribed;
      expect(unsubscribed, isNotNull);
      expect(unsubscribed.id, equals(MessageTypes.CODE_UNSUBSCRIBED));
      expect(unsubscribed.unsubscribeRequestId, equals(85346237));
      expect(unsubscribed.details!.reason, equals('wamp.authentication.lost'));
      expect(unsubscribed.details!.subscription, equals(123322));
    });
    test('Published', () {
      var published = serializer.deserialize(Uint8List.fromList([131, 17, 26, 14, 73, 193, 175, 27, 0, 0, 0, 1, 8, 1, 246, 30])) as Published;
      expect(published, isNotNull);
      expect(published.id, equals(MessageTypes.CODE_PUBLISHED));
      expect(published.publishRequestId, equals(239714735));
      expect(published.publicationId, equals(4429313566));
    });
    test('Event', () {
      var event = serializer.deserialize(Uint8List.fromList([132, 24, 36, 27, 0, 0, 0, 1, 72, 143, 65, 219, 27, 0, 0, 0, 1, 8, 1, 246, 30, 160])) as Event;
      expect(event, isNotNull);
      expect(event.id, equals(MessageTypes.CODE_EVENT));
      expect(event.subscriptionId, equals(5512315355));
      expect(event.publicationId, equals(4429313566));
      expect(event.details, isNotNull);
      expect(event.details.publisher, isNull);
      expect(event.details.topic, isNull);
      expect(event.details.trustlevel, isNull);
      expect(event.arguments, isNull);
      expect(event.argumentsKeywords, isNull);

      event = serializer.deserialize(Uint8List.fromList([133, 24, 36, 27, 0, 0, 0, 1, 72, 143, 65, 219, 27, 0, 0, 0, 1, 8, 1, 246, 30, 160, 129, 24, 30])) as Event;
      expect(event, isNotNull);
      expect(event.id, equals(MessageTypes.CODE_EVENT));
      expect(event.subscriptionId, equals(5512315355));
      expect(event.publicationId, equals(4429313566));
      expect(event.details, isNotNull);
      expect(event.details.publisher, isNull);
      expect(event.details.topic, isNull);
      expect(event.details.trustlevel, isNull);
      expect(event.arguments![0], equals(30));
      expect(event.argumentsKeywords, isNull);

      event = serializer.deserialize(Uint8List.fromList([134, 24, 36, 27, 0, 0, 0, 1, 72, 143, 65, 219, 27, 0, 0, 0, 1, 8, 1, 246, 30, 160, 129, 102, 106, 111, 104, 110, 110, 121, 162, 102, 117, 115, 101, 114, 105, 100, 24, 123, 101, 107, 97, 114, 109, 97, 10])) as Event;
      expect(event, isNotNull);
      expect(event.id, equals(MessageTypes.CODE_EVENT));
      expect(event.subscriptionId, equals(5512315355));
      expect(event.publicationId, equals(4429313566));
      expect(event.details, isNotNull);
      expect(event.details.publisher, isNull);
      expect(event.details.topic, isNull);
      expect(event.details.trustlevel, isNull);
      expect(event.arguments![0], equals('johnny'));
      expect(event.argumentsKeywords!['userid'], equals(123));
      expect(event.argumentsKeywords!['karma'], equals(10));

      event = serializer.deserialize(Uint8List.fromList([134, 24, 36, 27, 0, 0, 0, 1, 72, 143, 65, 219, 27, 0, 0, 0, 1, 8, 1, 246, 30, 161, 105, 112, 117, 98, 108, 105, 115, 104, 101, 114, 26, 0, 18, 202, 52, 129, 102, 106, 111, 104, 110, 110, 121, 162, 105, 102, 105, 114, 115, 116, 110, 97, 109, 101, 100, 74, 111, 104, 110, 103, 115, 117, 114, 110, 97, 109, 101, 99, 68, 111, 101])) as Event;
      expect(event, isNotNull);
      expect(event.id, equals(MessageTypes.CODE_EVENT));
      expect(event.subscriptionId, equals(5512315355));
      expect(event.publicationId, equals(4429313566));
      expect(event.details, isNotNull);
      expect(event.details.publisher, equals(1231412));
      expect(event.details.topic, isNull);
      expect(event.details.trustlevel, isNull);
      expect(event.arguments![0], equals('johnny'));
      expect(event.argumentsKeywords!['firstname'], equals('John'));
      expect(event.argumentsKeywords!['surname'], equals('Doe'));

      event = serializer.deserialize(Uint8List.fromList([134, 24, 36, 27, 0, 0, 0, 1, 72, 143, 65, 219, 27, 0, 0, 0, 1, 8, 1, 246, 30, 163, 105, 112, 117, 98, 108, 105, 115, 104, 101, 114, 26, 0, 18, 202, 52, 101, 116, 111, 112, 105, 99, 105, 100, 101, 46, 100, 101, 46, 99, 111, 109, 106, 116, 114, 117, 115, 116, 108, 101, 118, 101, 108, 1, 129, 102, 106, 111, 104, 110, 110, 121, 162, 105, 102, 105, 114, 115, 116, 110, 97, 109, 101, 100, 74, 111, 104, 110, 103, 115, 117, 114, 110, 97, 109, 101, 99, 68, 111, 101])) as Event;
      expect(event, isNotNull);
      expect(event.id, equals(MessageTypes.CODE_EVENT));
      expect(event.subscriptionId, equals(5512315355));
      expect(event.publicationId, equals(4429313566));
      expect(event.details, isNotNull);
      expect(event.details.publisher, equals(1231412));
      expect(event.details.topic, equals('de.de.com'));
      expect(event.details.trustlevel, equals(1));
      expect(event.arguments![0], equals('johnny'));
      expect(event.argumentsKeywords!['firstname'], equals('John'));
      expect(event.argumentsKeywords!['surname'], equals('Doe'));
    });
  });
}