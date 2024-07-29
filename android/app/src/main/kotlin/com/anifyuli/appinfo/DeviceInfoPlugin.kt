package com.anifyuli.appinfo

import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DeviceInfoPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.anifyuli.appinfo/device_info")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getDeviceInfo") {
            val info = mutableMapOf<String, Any>()
            info["Model"] = Build.MODEL
            info["Brand"] = Build.BRAND
            info["Device"] = Build.DEVICE
            info["Android version"] = Build.VERSION.RELEASE
            info["SDK version"] = Build.VERSION.SDK_INT
            info["Manufacturer"] = Build.MANUFACTURER
            info["Product"] = Build.PRODUCT
            result.success(info)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}