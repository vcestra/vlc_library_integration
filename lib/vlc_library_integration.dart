import 'vlc_library_integration_platform_interface.dart';

class VlcLibraryIntegration {
  Future<void> play() {
    return VlcLibraryIntegrationPlatform.instance.play();
  }

  Future<void> initialize() {
    return VlcLibraryIntegrationPlatform.instance.initialize();
  }

  Future<void> release() {
    return VlcLibraryIntegrationPlatform.instance.release();
  }
}
