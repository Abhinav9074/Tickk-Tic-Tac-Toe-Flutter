// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controller/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe/utils/theme.dart';
import 'package:tic_tac_toe/view/screens/home/home_screen.dart';

class VsAi extends StatelessWidget {
  const VsAi({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AiController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.off(const HomeScreen());
        }, icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'AI',
          style: MyTextStyle.commonHeading,
        ),
      ),
      body: GetBuilder<AiController>(
        builder: (controller) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: controller.gameStatus == '-1'
                      ? controller.coverObjectVisibility == false
                          ? const Text(
                              'Your Turn',
                              style: MyTextStyle.mediumHeading,
                            )
                          : const Text(
                              '''AI's Turn''',
                              style: MyTextStyle.mediumHeading,
                            )
                      : controller.gameStatus == '0'
                          ? const Text(
                              '''You Win !''',
                              style: MyTextStyle.mediumHeading,
                            )
                          : controller.gameStatus == '1'
                              ? const Text(
                                  '''You Lose !''',
                                  style: MyTextStyle.mediumHeading,
                                )
                              : const Text(
                                  '''Draw !''',
                                  style: MyTextStyle.mediumHeading,
                                ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index1) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.checkMark(index1, index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: controller.list[index1][index] ==
                                                0
                                            ? const Color.fromARGB(
                                                60, 70, 163, 255)
                                            : controller.list[index1][index] ==
                                                    -1
                                                ? const Color.fromARGB(
                                                    61, 255, 130, 126)
                                                : const Color.fromARGB(
                                                    255, 224, 223, 223),
                                        border: Border.all(
                                          color: controller.list[index1]
                                                      [index] ==
                                                  0
                                              ? const Color.fromARGB(
                                                  255, 70, 163, 255)
                                              : controller.list[index1]
                                                          [index] ==
                                                      -1
                                                  ? const Color.fromARGB(
                                                      255, 255, 130, 126)
                                                  : const Color.fromARGB(
                                                      255, 224, 223, 223),
                                        )),
                                    width: 200,
                                    height: 200,
                                    child: Center(
                                      child: controller.list[index1][index] == 0
                                          ? const Text(
                                              '✖',
                                              style: MyTextStyle.xIconText,
                                            )
                                          : controller.list[index1][index] == -1
                                              ? const Text(
                                                  '⭕',
                                                  style: MyTextStyle.oIconText,
                                                )
                                              : const SizedBox(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Visibility(
                        visible: controller.coverObjectVisibility == false
                            ? false
                            : true,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
                controller.gameStatus != '-1'
                    ? ElevatedButton.icon(
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.fromLTRB(90, 10, 90, 10)),
                            shape: MaterialStatePropertyAll(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: () {
                          controller.resetAll();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text(
                          'Play Again',
                          style: MyTextStyle.lightText,
                        ))
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
