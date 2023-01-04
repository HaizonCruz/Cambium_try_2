import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class CircularLoad extends StatefulWidget {
  const CircularLoad(this.controllerOne, {super.key});

  final FlutterGifController controllerOne;

  @override
  State<CircularLoad> createState() => _CircularLoadState();
}

class _CircularLoadState extends State<CircularLoad> {
  @override
  void initState() {
    widget.controllerOne
        .repeat(min: 0, max: 28, period: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GifImage(
          image: const AssetImage('assets/images/image.gif'),
          controller: widget.controllerOne),
    );
  }
}
