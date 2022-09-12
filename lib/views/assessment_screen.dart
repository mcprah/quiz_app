import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/test_controllers.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/views/question_screen.dart';
import 'package:test_app/widgets/app_button.dart';
import 'package:test_app/widgets/appbar.dart';

class AssesmentScreen extends StatefulWidget {
  const AssesmentScreen({Key? key}) : super(key: key);

  @override
  State<AssesmentScreen> createState() => _AssesmentScreenState();
}

class _AssesmentScreenState extends State<AssesmentScreen> {
  TestController testController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 80.0),
        child: MyAppBar(
          title: "Assessment",
          hasBackLeadingButton: false,
          hasCancelActionButton: false,
          largeTitleSize: true,
          titleFontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              child: Padding(
                padding: EdgeInsets.only(bottom: 64.0),
                child: Image(
                  image: AssetImage(
                    'assets/images/assessment-img-bg.png',
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 340,
                    child: Text(
                      "This assessment helps us  understand your weaknesses and strengths so as to help you prep better",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Image.asset(
                    'assets/images/assessment-img.png',
                    fit: BoxFit.fill,
                    width: 260.0,
                    height: 260.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        hasFixedSize: false,
        btnOnPressed: () {
          testController.correctAnswers.value = 0;
          testController.wrongAnswers.value = 0;
          testController.correctAnswers.value = 0;
          testController.wrongAnswers.value = 0;
          testController.totalNoOfQuestions.value = 0;
          testController.activeQuestionIndex.value = 0;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuestionScreen(
                title: "Living things and Non-living things",
              ),
            ),
          );
        },
        child: Text(
          "Begin Assessment",
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: ThemeColors.appWhiteColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
