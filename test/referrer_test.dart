import 'package:flutter_test/flutter_test.dart';
import 'package:referrer/referrer.dart';
import 'package:referrer/referrer_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockReferrerPlatform
    with MockPlatformInterfaceMixin
    implements ReferrerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ReferrerPlatform initialPlatform = ReferrerPlatform.instance;

  test('getPlatformVersion', () async {
    Referrer referrerPlugin = Referrer();
    MockReferrerPlatform fakePlatform = MockReferrerPlatform();
    ReferrerPlatform.instance = fakePlatform;

    expect(await referrerPlugin.getReferrer(), '42');
  });
}
