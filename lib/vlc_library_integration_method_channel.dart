import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'vlc_library_integration_platform_interface.dart';

/// An implementation of [VlcLibraryIntegrationPlatform] that uses method channels.
class MethodChannelVlcLibraryIntegration extends VlcLibraryIntegrationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('vlc_library_integration');

  @override
  Future<void> play(String url) async {
    return await methodChannel.invokeMethod('play', {'url': url});
  }

  @override
  Future<void> stop() async {
    return await methodChannel.invokeMethod('stop');
  }

  @override
  Future<void> initialize() async {
    return await methodChannel.invokeMethod('initialize');
  }

  @override
  Future<void> release() async {
    return await methodChannel.invokeMethod('release');
  }
}
