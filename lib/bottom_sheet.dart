import 'package:cambium_try_2/circular_progress.dart';
import 'package:cambium_try_2/linear_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class BottomSheetClass extends StatefulWidget {
  const BottomSheetClass({Key? key}) : super(key: key);

  @override
  State<BottomSheetClass> createState() => _BottomSheetClassState();
}

class _BottomSheetClassState extends State<BottomSheetClass>
    with SingleTickerProviderStateMixin {
  void bottomSheets(int buttonValue) {
    showModalBottomSheet(
        backgroundColor: Colors.yellow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return StatefulBuilder(builder: (context, setNewState) {
                  return FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          topLeft: Radius.circular(25),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 5, 0, 5),
                                        child: buttonValue == 0
                                            ? const Text(
                                                'Speed Test',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const Text(
                                                'Restart Router',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF5F5F5),
                                        shape: BoxShape.circle,
                                      ),
                                      margin: const EdgeInsets.all(15),
                                      child: CloseButton(
                                        color: Colors.black38,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 1.2,
                                  width: double.infinity,
                                  color: Color.fromARGB(
                                      (0.25 * 255).round(), 0, 0, 0),
                                ),
                                Container(
                                  width: 400,
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 50, 10, 20),
                                  child: buttonValue == 0
                                      ? const LinearProgress()
                                      : const CircularProgress(),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  );
                });
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => bottomSheets(0),
            child: const Text('Open Bottom Sheet'),
          ),
          ElevatedButton(
            onPressed: () {
              Loader.show(context,
                  isSafeAreaOverlay: false,
                  progressIndicator: const CircularProgress(),
                  overlayColor: Colors.black.withOpacity(0.5));
            },
            child: const Text('Open Circular Load'),
          )
        ],
      ),
    );
  }
}
