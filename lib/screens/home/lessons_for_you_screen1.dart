import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_banao/helper/app_layout.dart';
import 'package:flutter_task_banao/helper/colors.dart';
import '../../model/LessonsForYouModel1.dart';

class LessonsForYouScreen1 extends StatelessWidget {
  Future<LessonsForYouModel1> loadAssets() async {
    var data = await rootBundle.loadString("json_data/programs1.json");
    var decodedjson = await jsonDecode(data);
    LessonsForYouModel1 s = LessonsForYouModel1.formJson(decodedjson);
    // print(data);
    // print(decodedjson);
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: GetHW.h(16)),
      child: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<LessonsForYouModel1> snapshot) {
            if(!snapshot.hasData){return const CircularProgressIndicator();}else{
              return  Container(
                height: GetHW.h(280),
                width: GetHW.h(242),
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: MyColor.boxshowclr,
                        blurRadius: GetHW.h(8),
                        offset: const Offset(0.75, 0.00),

                      )
                    ],

                    borderRadius: BorderRadius.circular(GetHW.h(8)),
                    border: Border.all(
                      color: MyColor.grayboxbg,
                      width: 1,
                      style: BorderStyle.solid,
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(snapshot.data!.image),
                    SizedBox(height: GetHW.h(5),),
                    Padding(
                      padding:  EdgeInsets.all(GetHW.h(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: MyColor.blueText,
                            ),
                          ),
                          SizedBox(height: GetHW.h(8),),

                          Text(
                            snapshot.data!.desc,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black,
                            ),

                          ),
                          SizedBox(height: GetHW.h(15),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data!.lessons,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: MyColor.subTitleTextClr,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    // Text("${snapshot.data!.![0]}"),
                  ],
                ),
              );
            }
        },
      ),
    );
  }
}
