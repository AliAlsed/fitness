import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  @override
  List<PageViewModel> pages = [
    PageViewModel(
      title: "Fitness",
      body:
          "Success usually comes to those who are too busy to be looking for it.",
      image: Center(
        child: Image.asset("assets/images/1.png", height: 175.0),
      ),
      decoration: PageDecoration(
        pageColor: Color(0XFF192A56),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    PageViewModel(
      title: "Keep Going",
      body:
          "The only place where success comes before work is in the dictionary",
      image: Center(
        child: Image.asset("assets/images/2.png", height: 175.0),
      ),
      decoration: PageDecoration(
        pageColor: Color(0XFF192A56),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    PageViewModel(
      title: "Focus",
      body: "All progress takes place outside the comfort zone",
      image: Center(
        child: Image.asset("assets/images/3.png", height: 175.0),
      ),
      decoration: PageDecoration(
        pageColor: Color(0XFF192A56),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
    )
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: pages,
      onDone: () {
        // When done button is press
        Navigator.pushReplacementNamed(context, '/home');
      },
      onSkip: () {
        // You can also override onSkip callback
        Navigator.pushReplacementNamed(context, '/home');
      },
      showSkipButton: true,
      skip: const Icon(
        Icons.skip_next,
        color: Colors.white,
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text("Done",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.deepOrange,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
