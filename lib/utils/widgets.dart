import 'package:flutter/material.dart';
import '../res/app_layout.dart';
import '../res/colors/app_color.dart';

Text titleTextNormal(String data,  double fSize,fWeight,){
  return Text(data,
    style: TextStyle(
      fontSize: fSize,
      fontWeight: FontWeight.w500,
      fontFamily: "lorafont",
      color: Colors.black
    ),);
}
Text subTitleText(String data, double fSize){
  return Text(data,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: fSize,
      fontWeight: FontWeight.w500,
      color: MyColor.subTitleTextClr,
    ),);
}
Widget myContainer(String data ,String img){
  return  Container(
    height: GetHW.h(48),
    width: GetHW.h(160),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(GetHW.h(8)),
      border: Border.all(
          color: MyColor.blueText,
          style: BorderStyle.solid
      ),

    ),
    child: Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: GetHW.h(30),),
          Stack(
          children: [
              Image.asset(img),
          ], ),
          SizedBox(width: GetHW.h(10),),
          Text(data,style: const TextStyle(fontSize: 14,color: Color(0xff598bed),fontWeight: FontWeight.w600),),
        ],
      ),
    )
    );

}

Widget programsViewRow1(String title){
  return    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Text("Programs for you "),
      // titleTextNormal("Programs for you ", context,,),
      titleTextNormal(
          title,  18, FontWeight.w500),
      // Text("view"),
    ],
  );

}

Widget programsViewRow(String title){
  return    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text("Programs for you "),
        // titleTextNormal("Programs for you ", context,,),
        titleTextNormal(
            title,  18, FontWeight.w500),
        Row(
          children: [
            subTitleText("View all", 12),
            const ImageIcon(AssetImage('assets/aro.png')),
          ],
        ),
        // Text("view"),
      ],
    ),
  );

}

