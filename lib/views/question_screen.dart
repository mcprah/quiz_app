import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/test_controllers.dart';
import 'package:test_app/models/test_question.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/widgets/appbar.dart';
import 'package:test_app/widgets/questions_component.dart';

class QuestionScreen extends StatefulWidget {
  final String? title;
  const QuestionScreen({Key? key, this.title}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  TestController testController = Get.find();

  bool isSwitched = false;
  TestQuestion testQuestion1 = TestQuestion(
    question: "How is the night?",
    options: [
      Option(
        id: "a",
        value: "By using a sickle",
      ),
      Option(
        id: "b",
        value: "By using a harvestor",
      ),
      Option(
        id: "c",
        value: "By uprooting",
      ),
      Option(
        id: "d",
        value: "By using a cutlass",
      )
    ].toList(),
    answer: "a",
  );
  TestQuestion testQuestion2 = TestQuestion(
    question: "What is the name of the tallest mountain on earth?",
    options: [
      Option(
        id: "a",
        value: "Afajato",
      ),
      Option(
        id: "b",
        value: "Everest",
      ),
      Option(
        id: "c",
        value: "Makalu",
      ),
      Option(
        id: "d",
        value: "Cameroon",
      )
    ].toList(),
    answer: "b",
  );
  TestQuestion testQuestion3 = TestQuestion(
    question: "What is my name?",
    options: [
      Option(
        id: "a",
        value: "Kwame",
      ),
      Option(
        id: "b",
        value: "Araba",
      ),
      Option(
        id: "c",
        value: "Sackey",
      ),
      Option(
        id: "d",
        value: "Rich",
      )
    ].toList(),
    answer: "b",
  );

  @override
  Widget build(BuildContext context) {
    List<TestQuestion> testQuestions = [
      testQuestion1,
      testQuestion2,
      testQuestion3,
    ];
    testController.totalNoOfQuestions.value = testQuestions.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: MyAppBar(
          title: widget.title,
          hasCancelActionButton: false,
          hasBackLeadingButton: true,
          hasMoreMenus: true,
          appbarIsLight: true,
          largeTitleSize: false,
        ),
      ),
      backgroundColor: ThemeColors.appLightBgColor,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 14,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF2D3E50),
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "00:40:55",
                      style: TextStyle(
                        color: ThemeColors.appAccentColor,
                      ),
                    ),
                    const VerticalDivider(
                      width: 18,
                      thickness: 1,
                      color: ThemeColors.appAccentColor,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Image(
                                image: AssetImage(
                                  'assets/images/icons/percentage-complete.png',
                                ),
                                width: 19,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "65.60%",
                                style: TextStyle(
                                  color: ThemeColors.appAccentColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Image(
                                image: AssetImage(
                                  'assets/images/icons/speedometer.png',
                                ),
                                width: 19,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "240s",
                                style: TextStyle(
                                  color: ThemeColors.appAccentColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Image(
                                image: AssetImage(
                                  'assets/images/icons/passed.png',
                                ),
                                width: 19,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Obx(() {
                                return Text(
                                  "${testController.correctAnswers.value}",
                                  style: const TextStyle(
                                    color: ThemeColors.appAccentColor,
                                  ),
                                );
                              })
                            ],
                          ),
                          Row(
                            children: [
                              const Image(
                                image: AssetImage(
                                  'assets/images/icons/failed.png',
                                ),
                                width: 19,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Obx(() {
                                return Text(
                                  "${testController.wrongAnswers.value}",
                                  style: const TextStyle(
                                    color: ThemeColors.appAccentColor,
                                  ),
                                );
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      width: 12,
                      thickness: 1,
                      color: ThemeColors.appAccentColor,
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: ThemeColors.appAccentColor,
                      activeColor: ThemeColors.appDeepAccentColor,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 38),
                child: Obx(() {
                  return Text(
                    testQuestions[testController.activeQuestionIndex.value]
                        .question
                        .toString(),
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  );
                })),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 49,
              width: MediaQuery.of(context).size.width,
              color: ThemeColors.appSecondaryDarkColor,
              child: Center(
                child: Text(
                  "Choose the right answer to the question above",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ThemeColors.appWhiteColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(child: Obx(() {
              return QuestionsComponent(
                testQuestion:
                    testQuestions[testController.activeQuestionIndex.value],
              );
            }))
          ],
        ),
      ),
    );
  }
}
