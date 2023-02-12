import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_banao/helper/app_layout.dart';
import 'package:flutter_task_banao/helper/colors.dart';
import '../../model/lessons_for_you_model.dart';

class LessonsForYouScreen extends StatelessWidget {
  const LessonsForYouScreen({super.key});

  Future<LessonsForYouModel> loadAssets() async {
    var data = await rootBundle.loadString("json_data/programs.json");
    var decodedjson = await jsonDecode(data);
    LessonsForYouModel s = LessonsForYouModel.formJson(decodedjson);
    // print(data);
    // print(decodedjson);
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: GetHW.h(16)),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      child: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<LessonsForYouModel> snapshot) {
            if(!snapshot.hasData){return const CircularProgressIndicator();}else{
              return  Container(
                height: GetHW.h(280),
                width: GetHW.h(242),
                decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: MyColor.boxshowclr,
                        blurRadius: 8.0,
                        offset: Offset(0.75, 0.00),

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
                          SizedBox(height: GetHW.h(10),),

                          Text(

                            snapshot.data!.desc,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.black,
                              // height: 1.6
                            ),

                          ),
                          SizedBox(height: GetHW.h(10),),

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
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(GetHW.h(14)),
                                  border: Border.all(
                                    color: MyColor.blueText,
                                  )
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: GetHW.h(16),vertical: GetHW.h(6)),
                                  child: const Text("Book",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: MyColor.blueText,
                                    ),                      ),
                                ),
                              )
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
