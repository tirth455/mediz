import 'package:flutter/material.dart';

import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black12),

      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.tCOI1NpUNYSGC8H-OQUm2wHaEK&pid=Api&P=0&h=180"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Image.network("https://tse1.mm.bing.net/th?id=OIP.G-sgCxmCr5OYequhIHrMTQHaHa&pid=Api&P=0&h=180",height: 200,width: 200,)
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    OnboardingPage(
      title: 'Welcome to TaskMaster!',
      description: 'HealthTrack helps you manage and share your blood reports effortlessly, giving you and your doctors seamless access to crucial health data.',
      image: "https://tse4.mm.bing.net/th?id=OIP.HY_y03qBpL8MVjoIbqpDGAHaE8&pid=Api&P=0&h=180",
    ),
    OnboardingPage(
      title: 'Manage Your Blood Reports Easily',
      description: 'Upload Reports: Quickly add your blood test reports through a simple upload process.',
      image: "https://tse4.mm.bing.net/th?id=OIP._7HSI1-VLkwNMBT992Ly8wHaE8&pid=Api&P=0&h=180",
    ),
    OnboardingPage(
      title: 'Manage Your Blood Reports Easily',
      description: 'Secure Storage: Your data is stored securely and privately.',
      image: "https://tse1.mm.bing.net/th?id=OIP.2EBmMNKHnjNeHNYOgWKWkAHaEW&pid=Api&P=0&h=180",
    ),
    OnboardingPage(
      title: 'Get Started',
      description: 'You’re Ready to Go!Start managing your blood reports and connecting with your healthcare providers through HealthTrack. Explore the app to see all the features available to you.',
      image: "https://tse3.mm.bing.net/th?id=OIP.JavyE4WsYfCHn9hs9cqiAgHaD4&pid=Api&P=0&h=180",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _pages,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _currentPage > 0
                    ? GestureDetector(
                  onTap: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                    : Container(),
                Row(
                  children: List.generate(_pages.length, (int index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                _currentPage < _pages.length - 1
                    ? GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                    : GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingPage({required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image,scale:3.0),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}