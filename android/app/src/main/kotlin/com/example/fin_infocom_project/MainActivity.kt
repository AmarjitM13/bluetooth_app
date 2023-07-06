package com.example.fin_infocom_project

import android.content.Context
import android.bluetooth.BluetoothAdapter
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "bluetooth_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->

            if (call.method == "turnOnBluetooth") {
                val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
                if (bluetoothAdapter != null) {
                    if (!bluetoothAdapter.isEnabled) {
                        val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
                        startActivityForResult(enableBluetoothIntent, 0)
                    }
                    result.success(null)
                } else {
                    result.error("BLUETOOTH_UNSUPPORTED", "Bluetooth is not supported on this device.", null)
                }
            } else if (call.method == "turnOffBluetooth") {
                val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
                if (bluetoothAdapter != null) {
                    if (bluetoothAdapter.isEnabled) {
                        bluetoothAdapter.disable()
                    }
                    result.success(null)
                } else {
                    result.error("BLUETOOTH_UNSUPPORTED", "Bluetooth is not supported on this device.", null)
                }
            } else if (call.method == "getBluetoothStatus") {
                val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
                val status = when {
                    bluetoothAdapter == null -> "Unsupported"
                    bluetoothAdapter.isEnabled -> "Enabled"
                    else -> "Disabled"
                }
                result.success(status)
            } else {
                result.notImplemented()
            }
        }
    }
}
