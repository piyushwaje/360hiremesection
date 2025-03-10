import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class unimetor_program extends StatefulWidget {
  const unimetor_program({super.key});

  @override
  State<unimetor_program> createState() => _unimetor_programState();
}

class _unimetor_programState extends State<unimetor_program> {
  final List<String> images = [
    "assets/uniiamge1.png",
    "assets/uniiamge2.png",
    "assets/uniiamge3.png",
    "assets/uniiamge4.png",
  ];

  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _prevImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: const Text(
            "Unimentors",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.white, // The color is masked by the shader
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: CarouselSlider(
                    items: images.map((image) {
                      return Image.asset(image, fit: BoxFit.contain, width: double.infinity);
                    }).toList(),
                    options: CarouselOptions(
                      height: screenHeight * .2,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 0, // Added slight padding
                  child: GestureDetector(
                    onTap: _prevImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black54, width: 2), // White border
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black54, size: 10),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 0, // Added slight padding
                  child: GestureDetector(
                    onTap: _nextImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black54, width: 2), // White border
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black54, size: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return Container(
                  width: 5.0,
                  height: 5.0,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "What is Hiremi 360\u00B0",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenHeight * .021,
                                    color: Colors.black, // Masked by the shader
                                  ),
                                ),
                                TextSpan(
                                  text: " Unimentor",
                                  style: TextStyle(
                                    color: Colors.white, // Static color
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenHeight * .021,
                                  ),
                                ),
                                TextSpan(
                                  text: " ?",
                                  style: TextStyle(
                                    color: Colors.black, // Static color
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenHeight * .021,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Image.asset("assets/labledec.png",height: screenHeight * .06,),

                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        text: "All-in-one guide for Corporate mentorship! Get expert mentorship, stay ahead of market trends, and make smart academic and career moves. With a guaranteed mentor in your preferred domain and Achieve success during your college years. ",
                        style: TextStyle(
                          color: Color(0xFF7D7D7D), // Grey color for the main text
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * .015,
                        ),
                        children: [
                          TextSpan(
                            text: "#FutureReady🚀",
                            style: TextStyle(
                              color: Colors.black, // Black color for #FutureReady
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: screenHeight * .015,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Why Choose Hiremi 360\u00B0",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * .021,
                          color: Colors.black, // Masked by the shader
                        ),
                      ),
                      TextSpan(
                        text: " Unimentor",
                        style: TextStyle(
                          color: Colors.white, // Static color
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * .021,
                        ),
                      ),
                      TextSpan(
                        text: " ?",
                        style: TextStyle(
                          color: Colors.black, // Static color
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * .021,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text(
                  " Key features of Hiremi 360\u00B0 Unimentor Program",
                  style: TextStyle(
                    fontSize: screenHeight * .015,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Colors.white, // The color is masked by the shader
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/unimetor2.png",fit: BoxFit.contain,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Who Does it Help?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * .021,
                          color: Colors.black, // Masked by the shader
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text(
                  "Perfectly Designed for College - goers",
                  style: TextStyle(
                    fontSize: screenHeight * .015,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Colors.white, // The color is masked by the shader
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/unimetor3.png",fit: BoxFit.contain,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Your ultimate College Companion Unimentor Program for all years effectively.",style: TextStyle(
                color: Color(0xFF7D7D7D), // Grey color for the main text
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: screenHeight * .015,
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 ,top: 20),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF0075FF), Color(0xFFC1272D)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Skills you will gain",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * .021,
                          color: Colors.black, // Masked by the shader
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/unimetor4.png",fit: BoxFit.contain,),
            ),

          ],
        ),
      ),
    );
  }
}
