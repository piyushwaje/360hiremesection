import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hiremesection/screen/unimetor_program.dart';
import 'package:provider/provider.dart';
import 'dashboardprovider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController _controller;
  late Timer _timer;

  final List<String> images = [
    'assets/Banner1.png',
    'assets/Banner1.png',
    'assets/Banner1.png',
    'assets/Banner1.png'
  ];

  @override
  void initState() {
    super.initState();
    final imageProvider = context.read<ImageStateProvider>();
    _controller = PageController(initialPage: imageProvider.currentIndex);

    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (!mounted) return;
      imageProvider.nextImage(images.length);
      _controller.animateToPage(
        imageProvider.currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/Hiremi_360.png", height: 15),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Slider
            SizedBox(
              height: screenHeight * 0.27, // Set a fixed height for the slider
              child: Consumer<ImageStateProvider>(
                builder: (context, provider, child) {
                  return PageView.builder(
                    controller: _controller,
                    itemCount: images.length,
                    onPageChanged: provider.setCurrentIndex,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Section Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hiremi 360’s Featured",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),

            // GridView with Fixed Height
            SizedBox(
              child: GridView.count(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevents scrolling inside GridView
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => unimetor_program()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          // Background Image with Opacity
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/image1.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: screenwidth *
                                          0.1, // Slightly larger to accommodate padding
                                      height: screenwidth * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(screenwidth *
                                            0.01), // Adds inner spacing
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/support_agent.png',
                                            fit: BoxFit
                                                .contain, // Adjust as needed
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Unimentor Program",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.025,
                                    // backgroundColor: Colors.white.withOpacity(
                                    //     0.5), // Slight background for readability
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hiremi 360’s Featured Program",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.015,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          // Background Image with Opacity
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/image2.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: screenwidth *
                                          0.1, // Slightly larger to accommodate padding
                                      height: screenwidth * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(screenwidth *
                                            0.01), // Adds inner spacing
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/cast_for_education.png',
                                            fit: BoxFit
                                                .contain, // Adjust as needed
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Training + Internship",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.024,
                                    // backgroundColor: Colors.white.withOpacity(
                                    //     0.5), // Slight background for readability
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hiremi 360’s Featured Program",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.015,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          // Background Image with Opacity
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/image3.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: screenwidth *
                                          0.1, // Slightly larger to accommodate padding
                                      height: screenwidth * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(screenwidth *
                                            0.01), // Adds inner spacing
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/bar_chart_4_bars.png',
                                            fit: BoxFit
                                                .contain, // Adjust as needed
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Corporate Launchpad",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.023,
                                    // backgroundColor: Colors.white.withOpacity(
                                    //     0.5), // Slight background for readability
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hiremi 360’s Featured Program",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.015,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          // Background Image with Opacity
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/image4.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: screenwidth *
                                          0.1, // Slightly larger to accommodate padding
                                      height: screenwidth * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(screenwidth *
                                            0.01), // Adds inner spacing
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/Vector.png',
                                            fit: BoxFit
                                                .contain, // Adjust as needed
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Live Project Hub",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.025,
                                    // backgroundColor: Colors.white.withOpacity(
                                    //     0.5), // Slight background for readability
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hiremi 360’s Featured Program",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenwidth * 0.015,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                 GestureDetector(
                   onTap: (){},
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Stack(
                       children: [
                         // Background Image with Opacity
                         ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           child: Image.asset(
                             'assets/image5.png',
                             fit: BoxFit.cover,
                             width: double.infinity,
                             height: double.infinity,
                           ),
                         ),
                         // Text at the bottom
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Align(
                                   alignment: Alignment.centerLeft,
                                   child: Container(
                                     width: screenwidth *
                                         0.1, // Slightly larger to accommodate padding
                                     height: screenwidth * 0.1,
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       shape: BoxShape.circle,
                                     ),
                                     child: Padding(
                                       padding: EdgeInsets.all(screenwidth *
                                           0.01), // Adds inner spacing
                                       child: ClipOval(
                                         child: Image.asset(
                                           'assets/Vector1.png',
                                           fit: BoxFit
                                               .contain, // Adjust as needed
                                         ),
                                       ),
                                     ),
                                   )),
                               SizedBox(
                                 height: 5,
                               ),
                               Text(
                                 "Mock Tests",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: screenwidth * 0.025,
                                   // backgroundColor: Colors.white.withOpacity(
                                   //     0.5), // Slight background for readability
                                 ),
                               ),
                               SizedBox(
                                 height: 5,
                               ),
                               Text(
                                 "Hiremi 360’s Featured Program",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: screenwidth * 0.015,
                                 ),
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){},
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Stack(
                       children: [
                         // Background Image with Opacity
                         ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           child: Image.asset(
                             'assets/image6.png',
                             fit: BoxFit.cover,
                             width: double.infinity,
                             height: double.infinity,
                           ),
                         ),
                         // Text at the bottom
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Align(
                                   alignment: Alignment.centerLeft,
                                   child: Container(
                                     width: screenwidth *
                                         0.1, // Slightly larger to accommodate padding
                                     height: screenwidth * 0.1,
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       shape: BoxShape.circle,
                                     ),
                                     child: Padding(
                                       padding: EdgeInsets.all(screenwidth *
                                           0.01), // Adds inner spacing
                                       child: ClipOval(
                                         child: Image.asset(
                                           'assets/image61.png',
                                           fit: BoxFit
                                               .contain, // Adjust as needed
                                         ),
                                       ),
                                     ),
                                   )),
                               SizedBox(
                                 height: 5,
                               ),
                               Text(
                                 "Coming Soon",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: screenwidth * 0.025,
                                   // backgroundColor: Colors.white.withOpacity(
                                   //     0.5), // Slight background for readability
                                 ),
                               ),
                               SizedBox(
                                 height: 5,
                               ),
                               Text(
                                 "Hiremi 360’s Featured Program",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w500,
                                   fontSize: screenwidth * 0.015,
                                 ),
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                 )

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Learn More About Programs",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),

            // Second GridView with Fixed Height
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                height: screenHeight * .15,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                      color: Color(0xFFDDDDDD)), // Set border color to #DDDDDD
                  borderRadius:
                      BorderRadius.circular(8), // Optional: add rounded corners
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: -20,
                        right: -20,
                        child: Container(
                          height: screenHeight * .1,
                          width: screenHeight * .1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFF249DC).withOpacity(0.2),
                                Color(0xFF1B1D9C).withOpacity(0.2)
                              ], // Pink to Blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: screenHeight * .1,
                              width: screenHeight * .1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFF249DC).withOpacity(0.2),
                                    Color(0xFF1B1D9C).withOpacity(0.2)
                                  ], // Pink to Blue
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/support_agent.png",
                                  height: screenHeight *
                                      .045, // Adjust size dynamically
                                  width: screenHeight * .045,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Container(
                        width: screenwidth * .7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Unimentor Program",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: screenwidth * 0.045,
                              ),
                            ),
                            Text(
                              "Personalized guidance from industry experts to help individuals achieve their career goals.",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: screenwidth * 0.025,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tap");
                                // Handle tap
                              },
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenwidth * 0.025,
                                  color: Color(0xFF0870FF), // Custom color
                                  // Optional underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: Container(
                height: screenHeight * .15,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                      color: Color(0xFFDDDDDD)), // Set border color to #DDDDDD
                  borderRadius:
                      BorderRadius.circular(8), // Optional: add rounded corners
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: -20,
                        right: -20,
                        child: Container(
                          height: screenHeight * .1,
                          width: screenHeight * .1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFEFC59B).withOpacity(0.2),
                                Color(0xFF95152F).withOpacity(0.2)
                              ], // Pink to Blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: screenHeight * .1,
                              width: screenHeight * .1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFEFC59B).withOpacity(0.2),
                                    Color(0xFF95152F).withOpacity(0.2)
                                  ], // Pink to Blue
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/cast_for_education.png",
                                  height: screenHeight *
                                      .04, // Adjust size dynamically
                                  width: screenHeight * .04,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Container(
                        width: screenwidth * .73,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Training + Internship Program",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: screenwidth * 0.045,
                              ),
                            ),
                            Text(
                              "Practical internship experience to equip participants with essential skills and real-world knowledge.",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: screenwidth * 0.025,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tap");
                                // Handle tap
                              },
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenwidth * 0.025,
                                  color: Color(0xFF0870FF), // Custom color
                                  // Optional underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: Container(
                height: screenHeight * .15,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                      color: Color(0xFFDDDDDD)), // Set border color to #DDDDDD
                  borderRadius:
                      BorderRadius.circular(8), // Optional: add rounded corners
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: -20,
                        right: -20,
                        child: Container(
                          height: screenHeight * .1,
                          width: screenHeight * .1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF87E5FB).withOpacity(0.2),
                                Color(0xFF2A098B).withOpacity(0.2)
                              ], // Pink to Blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: screenHeight * .1,
                              width: screenHeight * .1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF87E5FB).withOpacity(0.2),
                                    Color(0xFF2A098B).withOpacity(0.2)
                                  ], // Pink to Blue
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/bar_chart_4_bars.png",
                                  height: screenHeight *
                                      .04, // Adjust size dynamically
                                  width: screenHeight * .04,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Container(
                        width: screenwidth * .7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Corporate Launchpad",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: screenwidth * 0.045,
                              ),
                            ),
                            Text(
                              "Customized training solutions designed to enhance the skills and productivity of a company's workforce.",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: screenwidth * 0.025,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tap");
                                // Handle tap
                              },
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenwidth * 0.025,
                                  color: Color(0xFF0870FF), // Custom color
                                  // Optional underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: Container(
                height: screenHeight * .175,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                      color: Color(0xFFDDDDDD)), // Set border color to #DDDDDD
                  borderRadius:
                      BorderRadius.circular(8), // Optional: add rounded corners
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: -20,
                        right: -20,
                        child: Container(
                          height: screenHeight * .1,
                          width: screenHeight * .1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFC14D).withOpacity(0.2),
                                Color(0xFFE22D00).withOpacity(0.2)
                              ], // Pink to Blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: screenHeight * .1,
                              width: screenHeight * .1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFC14D).withOpacity(0.2),
                                    Color(0xFFE22D00).withOpacity(0.2)
                                  ], // Pink to Blue
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/Vector.png",
                                  height: screenHeight *
                                      .04, // Adjust size dynamically
                                  width: screenHeight * .04,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Container(
                        width: screenwidth * .7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Live Project Hub",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: screenwidth * 0.045,
                              ),
                            ),
                            Text(
                              "Tailored training solutions designed to upskill your workforce, boost productivity, gain practical expertise through real-world projects",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: screenwidth * 0.025,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tap");
                                // Handle tap
                              },
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenwidth * 0.025,
                                  color: Color(0xFF0870FF), // Custom color
                                  // Optional underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10, bottom: 10),
              child: Container(
                height: screenHeight * .175,
                width: screenwidth,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                      color: Color(0xFFDDDDDD)), // Set border color to #DDDDDD
                  borderRadius:
                      BorderRadius.circular(8), // Optional: add rounded corners
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: -20,
                        right: -20,
                        child: Container(
                          height: screenHeight * .1,
                          width: screenHeight * .1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFD51619).withOpacity(0.2),
                                Color(0xFF76E4D2).withOpacity(0.2)
                              ], // Pink to Blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: screenHeight * .1,
                              width: screenHeight * .1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD51619).withOpacity(0.2),
                                    Color(0xFF76E4D2).withOpacity(0.2)
                                  ], // Pink to Blue
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/Mask_group.png",
                                  height: screenHeight *
                                      .04, // Adjust size dynamically
                                  width: screenHeight * .04,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Container(
                        width: screenwidth * .7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Mock Tests",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: screenwidth * 0.045,
                              ),
                            ),
                            Text(
                              "A mock test is a practice exam that mimics the real test format. It helps assess performance and improve preparation.",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: screenwidth * 0.025,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tap");
                                // Handle tap
                              },
                              child: Text(
                                "Learn More",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenwidth * 0.025,
                                  color: Color(0xFF0870FF), // Custom color
                                  // Optional underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
