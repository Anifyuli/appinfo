import "dart:async";
import "package:flutter/services.dart";

class DeviceInfoPlugin {
  static const platform = MethodChannel('com.anifyuli.appinfo/device_info');

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final Map<Object?, Object?> result =
          await platform.invokeMethod('getDeviceInfo');
      final Map<String, dynamic> deviceInfo =
          result.map((key, value) => MapEntry(key.toString(), value));
      return deviceInfo;
    } on PlatformException catch (e) {
      return {'error': 'Failed to get device info: ${e.message}'};
    }
  }
}
