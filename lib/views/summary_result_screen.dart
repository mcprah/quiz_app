import 'package:flutter/material.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/views/assessment_screen.dart';
import 'package:test_app/widgets/app_button.dart';
import 'package:test_app/widgets/appbar.dart';

class SummaryResultScreen extends StatefulWidget {
  final double score;
  const SummaryResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  State<SummaryResultScreen> createState() => _SummaryResultScreenState();
}

class _SummaryResultScreenState extends State<SummaryResultScreen> {
  @override
  Widget build(BuildContext context) {
    bool _passed = widget.score > 40 ? true : false;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80.0),
        child: MyAppBar(
          title: "Summary Result",
          hasCancelActionButton: true,
          hasBackLeadingButton: false,
          hasMoreMenus: false,
          appbarIsLight: false,
          appbarBackgroundColor: _passed
              ? ThemeColors.appAccentColor
              : ThemeColors.appLightDangerColor,
        ),
      ),
      backgroundColor: _passed
          ? ThemeColors.appAccentColor
          : ThemeColors.appLightDangerColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage(
                          _passed
                              ? 'assets/images/summary-img-1.png'
                              : 'assets/images/summary-img-2.png',
                        ),
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        fit: BoxFit.fitWidth,
                        repeat: ImageRepeat.noRepeat,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        _passed ? "You did it!" : "Let's try again!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.appWhiteColor),
                      ),
                      Text(
                        _passed
                            ? "That was great performance on the test. \n keep going."
                            : "Revise a bit more and give this another try. \nYes you can!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: ThemeColors.appWhiteColor),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 28,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: ThemeColors.appWhiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your Score",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge!),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${widget.score.round()}/100",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 41,
                                  ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            AppButton(
                              btnBackgroundColor: _passed
                                  ? ThemeColors.appSuccessColor
                                  : ThemeColors.appDangerColor,
                              hasFixedSize: true,
                              shape: const StadiumBorder(),
                              btnOnPressed: () {},
                              child: Text(
                                "View Details",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      color: ThemeColors.appWhiteColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/icons/share.png'),
                                    width: 18.0,
                                    height: 18.0,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Share",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: ThemeColors.appWhiteColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: _passed
                                ? ThemeColors.appDeepAccentColor
                                : ThemeColors.appDangerColor.withOpacity(0.2),
                            elevation: 0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AssesmentScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/icons/sync.png'),
                                    width: 24.0,
                                    height: 24.0,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Re - Test",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: ThemeColors.appWhiteColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: _passed
                                ? ThemeColors.appDeepAccentColor
                                : ThemeColors.appDangerColor.withOpacity(0.2),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Return to Course",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ThemeColors.appWhiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          ThemeColors.appWhiteColor.withOpacity(0.2)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
