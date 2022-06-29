import 'package:firist_project/task1/layout/login.dart';
import 'package:firist_project/task1/layout/register.dart';
import 'package:firist_project/task1/shared/component/Colors.dart';
import 'package:firist_project/task1/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class IntroScreen extends StatefulWidget {
  _IntroScreenState createState() => _IntroScreenState();
}

var boarderController = PageController();

List<BoardingModel> boarding = [
  BoardingModel(
      image: 'assets/images/3.png',
      title: '''Get food delivery to your
doorstep asap''',
      body:
      '''We have young and professional delivery teem that will bring your food as soon as possible to your doorstep'''),
  BoardingModel(
      image: 'assets/images/1.png',
      title: '''Buy Any Food from your
favorite restaurant''',
      body:
      '''We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'''),
];
bool isLast = false;

@override
class _IntroScreenState extends State<IntroScreen> {
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor:Color5 ,
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton1(
                      text: 'Skip',
                      height: 20,
                      width: 70,
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                            boarderController.nextPage(
                              duration: Duration(
                                microseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );


                      },
                    )
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: boarderController,
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SmoothPageIndicator(
                  controller: boarderController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 5,
                    dotWidth: 10,
                    expansionFactor: 2,
                    spacing: 5.0,
                    activeDotColor: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  text: 'Get Started',
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Don't has any account?''',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ElMessiri',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.teal),
                        )),
                  ],
                ),
              ],
            ),
          )),
    );
  }


  Widget buildBoardingItem(BoardingModel model) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('${model.title}',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ElMessiri',
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 30,
          ),
          Text('${model.body}',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'ElMessiri',
                fontSize: 20,
              )),
        ],
      );


}
