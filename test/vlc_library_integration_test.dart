import 'package:flutter_test/flutter_test.dart';
import 'package:vlc_library_integration/vlc_library_integration.dart';
import 'package:vlc_library_integration/vlc_library_integration_platform_interface.dart';
import 'package:vlc_library_integration/vlc_library_integration_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVlcLibraryIntegrationPlatform
    with MockPlatformInterfaceMixin
    implements VlcLibraryIntegrationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VlcLibraryIntegrationPlatform initialPlatform = VlcLibraryIntegrationPlatform.instance;

  test('$MethodChannelVlcLibraryIntegration is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVlcLibraryIntegration>());
  });

  test('getPlatformVersion', () async {
    VlcLibraryIntegration vlcLibraryIntegrationPlugin = VlcLibraryIntegration();
    MockVlcLibraryIntegrationPlatform fakePlatform = MockVlcLibraryIntegrationPlatform();
    VlcLibraryIntegrationPlatform.instance = fakePlatform;

    expect(await vlcLibraryIntegrationPlugin.getPlatformVersion(), '42');
  });
}
