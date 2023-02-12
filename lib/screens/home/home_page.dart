import 'package:flutter/material.dart';
import 'package:flutter_task_banao/helper/app_layout.dart';
import 'package:flutter_task_banao/helper/colors.dart';
import 'package:flutter_task_banao/screens/home/lessons_for_you_screen.dart';
import 'package:flutter_task_banao/screens/home/lessons_for_you_screen1.dart';
import '../../helper/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: MyColor.bgcolor,
        leading: const ImageIcon(
          AssetImage("assets/menu1.png",),
          color: MyColor.grayDarkClr,
        ),

        actions: [
          const ImageIcon(
            AssetImage("assets/msgicon.png",),
            color: MyColor.grayDarkClr,
          ),          SizedBox(width: GetHW.h(22),),
          const ImageIcon(
            AssetImage("assets/bell.png",),
            color: MyColor.grayDarkClr,
          ),          SizedBox(width: GetHW.h(18),),

        ],
      ),
      body: SafeArea(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: GetHW.h(16)),
                color: MyColor.bgcolor,
                height: GetHW.h(276-56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: GetHW.h(8+3),),
                    SizedBox(child: titleTextNormal("Hello Priya ", 20, FontWeight.w500)),
                    SizedBox(height: GetHW.h(3+2),),
                    subTitleText("What do you wanna learn today?", 12),
                    SizedBox(height: GetHW.h(44-13),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myContainer("Programs", "assets/v1.png"),
                        myContainer("Get help", "assets/v2.png"),
                      ],
                    ),
                    SizedBox(height: GetHW.h(8),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myContainer("Learn", "assets/v3.png"),
                        myContainer("DD Tracker", "assets/v3.png"),
                      ],
                    ),
                    Container(
                      // color: Colors.red,
                      height: GetHW.h(26),
                    ),
                  ],
                ),
              ),
              SizedBox(height: GetHW.h(24),),
              Column(
                children: [
                  programsViewRow("Programs for you",),
                  SizedBox(height: GetHW.h(24),),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          LessonsForYouScreen1(),
                          SizedBox(width: GetHW.h(16),),
                          LessonsForYouScreen1(),
                        ],
                      )),
                  SizedBox(height: GetHW.h(32),),
                  programsViewRow("Events and experiencs",),
                  SizedBox(height: GetHW.h(24),),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const LessonsForYouScreen(),
                          SizedBox(width: GetHW.h(16),),
                          const LessonsForYouScreen(),
                        ],
                      )),
                  SizedBox(height: GetHW.h(32),),
                  programsViewRow("Lessoons for you",),
                  SizedBox(height: GetHW.h(24),),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const LessonsForYouScreen(),
                          SizedBox(width: GetHW.h(16),),
                          const LessonsForYouScreen(),
                        ],
                      )),
                  SizedBox(height: GetHW.h(32),),



                ],
              ),
            ],
          )),
    );
  }
}
