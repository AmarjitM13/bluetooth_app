import 'package:fin_infocom_project/app/custom_widgets/custom_widgets.dart';
import 'package:fin_infocom_project/app/modules/dog_image/ui/dog_image_screen.dart';
import 'package:fin_infocom_project/app/modules/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('bluetooth_channel');
  String _bluetoothStatus = 'Unknown';
  bool bluetooth = false;

  @override
  void initState() {
    super.initState();
    _checkBluetoothStatus();
  }

  Future<void> _checkBluetoothStatus() async {
    try {
      final String status = await platform.invokeMethod('getBluetoothStatus');
      setState(() {
        _bluetoothStatus = status;
        bluetooth = _bluetoothStatus == 'Enabled';
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to get Bluetooth status: ${e.message}');
    }
  }

  Future<void> _turnOnBluetooth() async {
    try {
      await platform.invokeMethod('turnOnBluetooth');
    } on PlatformException catch (e) {
      debugPrint('Failed to turn on Bluetooth: ${e.message}');
    }
  }

  Future<void> _turnOffBluetooth() async {
    try {
      await platform.invokeMethod('turnOffBluetooth');
    } on PlatformException catch (e) {
      debugPrint('Failed to turn on Bluetooth: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          CustomButton(
            title: 'Dog Images',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DogImageScreen();
                  },
                ),
              );
            },
          ),
          CustomButton(
            title: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ProfileScreen();
                  },
                ),
              );
            },
          ),
          SwitchListTile(
            title: const Text(
              'Bluetooth',
            ),
            value: bluetooth,
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.grey.shade200,
            onChanged: (bool value) {
              setState(() {
                bluetooth ? _turnOffBluetooth() : _turnOnBluetooth();
                bluetooth = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
