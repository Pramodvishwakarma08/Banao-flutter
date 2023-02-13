import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_banao/helper/app_layout.dart';
import 'package:flutter_task_banao/helper/colors.dart';
import '../../model/programs_model.dart';
import 'package:http/http.dart' as http;

class ProgramsScreen extends StatelessWidget {
  Future<ProgramsModel> loadAssets() async {
    ProgramsModel pm;
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    pm = ProgramsModel.fromJson(jsonresponse);
    return pm;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: GetHW.h(16)),
      child: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<ProgramsModel> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return Row(
              children: [
                ...List.generate(snapshot.data!.items.length, (index) {
                  return Row(
                    children: [
                      Container(
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
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/ex2.png"),
                            SizedBox(
                              height: GetHW.h(5),
                            ),
                            Padding(
                              padding: EdgeInsets.all(GetHW.h(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: GetHW.h(8),),
                                  Text(
                                    snapshot.data!.items[index].category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: MyColor.blueText,
                                    ),
                                  ),
                                  SizedBox(
                                    height: GetHW.h(16),
                                  ),
                                  Text(
                                    snapshot.data!.items[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: GetHW.h(20),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${snapshot.data!.items[index].lesson} lesson",
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
                      ),
                      SizedBox(
                        width: GetHW.h(16),
                      ),

                    ],
                  );
                }),
                // SizedBox(width: 300,)
              ],
            );
          }
        },
      ),
    );
  }
}
