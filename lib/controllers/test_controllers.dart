import 'package:get/get.dart';

class TestController extends GetxController {
  var correctAnswers = 0.obs;
  var wrongAnswers = 0.obs;
  var totalNoOfQuestions = 0.obs;
  var activeQuestionIndex = 0.obs;

  double calculateResult() {
    return (correctAnswers.value / totalNoOfQuestions.value) * 100;
  }
}
