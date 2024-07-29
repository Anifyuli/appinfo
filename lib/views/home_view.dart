import 'package:appinfo/values/string.dart';
import 'package:appinfo/widgets/device_info_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final addVideoBrief = MainValue.addVideoBrief;
final addVideoButtonText = MainValue.addVideo;
final sysInfo = MainValue.sysInfoBrief;

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppInfo"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              addVideoBrief,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.video_file, size: 20),
                label: Text(addVideoButtonText,
                    style: const TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              sysInfo,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDeviceInfoDialog(context),
        tooltip: MainValue.showSysInfo,
        child: const Icon(Icons.info),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
