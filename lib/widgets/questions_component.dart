import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/test_controllers.dart';
import 'package:test_app/models/test_question.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/views/summary_result_screen.dart';

class QuestionsComponent extends StatefulWidget {
  final TestQuestion testQuestion;
  const QuestionsComponent({Key? key, required this.testQuestion})
      : super(key: key);

  @override
  State<QuestionsComponent> createState() => _QuestionsComponentState();
}

class _QuestionsComponentState extends State<QuestionsComponent> {
  TestController testController = Get.find();
  String selectedAnswer = "";
  List<String?> selectedAnswers = [""];
  bool answerSubmitted = false;
  bool gotAnswerCorrect = false;

  @override
  Widget build(BuildContext context) {
    int activeQuestionIndex = testController.activeQuestionIndex.value;
    List<Option>? testOptions = widget.testQuestion.options;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: Column(
                children: [
                  ...testOptions!
                      .map((option) => questionWidget(option.value, option.id))
                      .toList(),
                  const SizedBox(
                    height: 60,
                  ),
                  // if (activeQuestionIndex ==
                  //     testController.totalNoOfQuestions.value - 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (activeQuestionIndex > 0)
                            ? () {
                                testController.activeQuestionIndex.value =
                                    testController.activeQuestionIndex.value -
                                        1;
                                setState(() {
                                  // answerSubmitted = true;
                                });
                              }
                            : null,
                        child: const Text(
                          "Previous",
                          style: TextStyle(color: ThemeColors.appDarkColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: ThemeColors.appWhiteColor,
                          shadowColor: Colors.transparent,
                          minimumSize: const Size(
                            128,
                            54,
                          ),
                          side: const BorderSide(
                            width: 1,
                            color: ThemeColors.appGreyColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      ElevatedButton(
                        onPressed: (activeQuestionIndex <
                                testController.totalNoOfQuestions.value - 1)
                            ? () {
                                logAnswer();
                              }
                            : null,
                        child: const Text(
                          "Next",
                          style: TextStyle(color: ThemeColors.appDarkColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: ThemeColors.appWhiteColor,
                          shadowColor: Colors.transparent,
                          minimumSize: const Size(
                            128,
                            54,
                          ),
                          side: const BorderSide(
                            width: 1,
                            color: ThemeColors.appGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (activeQuestionIndex == testController.totalNoOfQuestions.value - 1)
          ElevatedButton(
            onPressed: () {
              logAnswer();
              double finalScore = testController.calculateResult();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryResultScreen(
                    score: finalScore,
                  ),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
              child: Center(
                child: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ThemeColors.appWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                ThemeColors.appWhiteColor.withOpacity(0.2),
              ),
            ),
          ),
      ],
    );
  }

  logAnswer() {
    if (selectedAnswer != "") {
      setState(
        () {
          answerSubmitted = false;
        },
      );
      setState(() {
        selectedAnswers[testController.activeQuestionIndex.value] =
            selectedAnswer;
        selectedAnswers.add("");
      });

      if (selectedAnswer == widget.testQuestion.answer) {
        setState(() {
          gotAnswerCorrect = true;
        });
        testController.correctAnswers.value =
            testController.correctAnswers.value + 1;
      } else {
        setState(() {
          gotAnswerCorrect = false;
        });
        testController.wrongAnswers.value =
            testController.wrongAnswers.value + 1;
      }

      if (testController.activeQuestionIndex.value ==
          testController.totalNoOfQuestions.value - 1) {
        testController.activeQuestionIndex.value =
            testController.activeQuestionIndex.value;
      } else {
        testController.activeQuestionIndex.value =
            testController.activeQuestionIndex.value + 1;
      }

      setState(() {
        selectedAnswer = "";
      });
    }
  }

  Widget questionWidget(text, index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = index;
            if (!answerSubmitted) {
              selectedAnswers[testController.activeQuestionIndex.value] = index;
            }
          });
          print(selectedAnswer);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: (selectedAnswer == index)
                    ? ThemeColors.appWhiteColor
                    : Colors.black,
                fontWeight: (selectedAnswer == index)
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 16,
              ),
            ),
            Visibility(
              visible:
                  (selectedAnswers[testController.activeQuestionIndex.value] ==
                      index),
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          alignment: Alignment.centerLeft,
          elevation: 0,
          primary: (selectedAnswers[testController.activeQuestionIndex.value] ==
                  index)
              ? (answerSubmitted)
                  ? (gotAnswerCorrect)
                      ? ThemeColors.appPrimaryColor
                      : Colors.red
                  : ThemeColors.appSelectedQuestionColor
              : ThemeColors.appLightBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          side: BorderSide(
            width: 1,
            color: ThemeColors.appGreyColor.withOpacity(0.2),
          ),
          minimumSize: const Size(
            double.maxFinite,
            66,
          ),
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
