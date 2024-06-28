import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'vlc_library_integration_method_channel.dart';

abstract class VlcLibraryIntegrationPlatform extends PlatformInterface {
  /// Constructs a VlcLibraryIntegrationPlatform.
  VlcLibraryIntegrationPlatform() : super(token: _token);

  static final Object _token = Object();

  static VlcLibraryIntegrationPlatform _instance =
      MethodChannelVlcLibraryIntegration();

  /// The default instance of [VlcLibraryIntegrationPlatform] to use.
  ///
  /// Defaults to [MethodChannelVlcLibraryIntegration].
  static VlcLibraryIntegrationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VlcLibraryIntegrationPlatform] when
  /// they register themselves.
  static set instance(VlcLibraryIntegrationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> play(String url) {
    throw UnimplementedError('play() has not been implemented.');
  }

  Future<void> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }

  Future<void> initialize() {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> release() {
    throw UnimplementedError('release() has not been implemented.');
  }
}
