package it.vcestra.vlc_library_integration

import android.content.Context
import android.net.Uri
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.videolan.libvlc.LibVLC
import org.videolan.libvlc.Media
import org.videolan.libvlc.MediaPlayer

/** VlcLibraryIntegrationPlugin */
class VlcLibraryIntegrationPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  private lateinit var context: Context
  private var libVLC: LibVLC? = null
  private var mediaPlayer: MediaPlayer? = null


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "vlc_library_integration")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method){
      "initialize" -> {
        initializeVLC();
        result.success("Init VLC Done!")
      }
      "release" -> {
        release()
        result.success("Release VLC Done!")
      }
      "play" -> {
        val url: String? = call.argument("url")
        if(url != null){
          play(url)
          result.success("Playing: $url")
        }else{
          result.error("URL_NOT_PROVIDED", "URL is required to play a media", null)
        }
      }
      "stop" -> {
        stop()
        result.success("Stop playing")
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun release() {
    mediaPlayer?.release()
    libVLC?.release()
    mediaPlayer = null
    libVLC = null
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    release()
  }

  private fun initializeVLC() {
    libVLC = LibVLC(context)
    mediaPlayer = MediaPlayer(libVLC)
  }

  private fun play(url: String) {
    val media = Media(libVLC, Uri.parse(url))
    mediaPlayer?.media = media
    mediaPlayer?.play()
  }

  private fun stop() {
    mediaPlayer?.stop()
  }

}
