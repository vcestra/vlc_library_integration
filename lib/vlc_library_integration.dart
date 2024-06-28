import 'vlc_library_integration_platform_interface.dart';

class VlcLibraryIntegration {
  static final VlcLibraryIntegration _instance =
      VlcLibraryIntegration._internal();

  VlcLibraryIntegration._internal();

  static VlcLibraryIntegration get instance => _instance;

  Future<void> play(String url) {
    return VlcLibraryIntegrationPlatform.instance.play(url);
  }

  Future<void> stop() {
    return VlcLibraryIntegrationPlatform.instance.stop();
  }

  Future<void> initialize() {
    return VlcLibraryIntegrationPlatform.instance.initialize();
  }

  Future<void> release() {
    return VlcLibraryIntegrationPlatform.instance.release();
  }
}
