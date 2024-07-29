import 'package:flutter/material.dart';
import 'package:appinfo/utils/sysinfo_util.dart';

void showDeviceInfoDialog(BuildContext context) async {
  Map<String, dynamic> deviceInfo = await DeviceInfoPlugin.getDeviceInfo();

  if (context.mounted) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Device Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: deviceInfo.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "${entry.key} : ",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${entry.value}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
