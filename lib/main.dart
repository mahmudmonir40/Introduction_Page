import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,

      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Lets go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Cox's Bazar Beach",
          body: " The beach in Cox's Bazar is the main attraction of the town with an unbroken length of 150 km also termed the longest natural sea beach in the world.",
          image: Image.asset("assets/beach.jpg",height: 200,width: 400,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Himchari",
          body: "Himchari consists of lush tropical rain forest, grasslands and trees, and features a number of waterfalls, the biggest of which cascades down toward the sandy, sun-drenched beach.",
          image: Image.asset("assets/himchori.jpg",height: 200,width: 400,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Inani Beach",
          body: "Inani Beach part of Cox's Bazar Beach, is an 18-kilometre-long sea beach in Ukhia Upazila of Cox's Bazar District, Bangladesh.",
          image: Image.asset("assets/inani.jpg",height: 200,width: 400,),
          decoration: pageDecoration,
        ),


        PageViewModel(
          title: "St. martin's Island",
          body: "St. Martin's Island is a small island in the northeastern part of the Bay of Bengal, about 9 km south of the tip of the Cox's Bazar-Teknaf peninsula, and forming the southernmost part of Bangladesh.",
          image: Image.asset("assets/saint1.jpg",height: 200,width: 400,),
          decoration: pageDecoration,
        ),


        PageViewModel(
          title: "Moheshkhali Island",
          body: "Moheshkhali Island is the main island of Moheshkhali Upazila, in the Cox's Bazar District of Bangladesh.",
          image: Image.asset("assets/island1.jpg",height: 200,width: 400,),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Matarbari Power Plant",
          body: "The Matarbari Power Plant is a 1,200 megawatt coal-fired power station under construction in Maheshkhali Upazila of Cox's Bazar District in south-eastern Bangladesh.",
          image: Image.asset("assets/matarbari.jpg",height: 200,width: 400,),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}