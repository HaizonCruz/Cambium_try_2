import 'package:cambium_try_2/gif_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with TickerProviderStateMixin {
  bool isRunning = false;
  late FlutterGifController _controllerOne;

  @override
  void initState() {
    _controllerOne = FlutterGifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controllerOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          width: 200,
          child: Visibility(
            visible: isRunning,
            child: CircularLoad(_controllerOne),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (isRunning) {
                  _controllerOne.stop();
                  isRunning = !isRunning;
                  Loader.hide();
                } else {
                  _controllerOne.repeat(
                      min: 0, max: 30, period: const Duration(seconds: 2));
                  isRunning = !isRunning;
                }
              });
            },
            child: const Text('Click')),
      ]),
    );
  }
}
