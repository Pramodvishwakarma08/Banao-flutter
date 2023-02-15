import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_banao/res/widgets.dart';
import '../../model/programs_model.dart';
import 'package:http/http.dart' as http;
import '../../res/app_layout.dart';
import '../../res/colors/app_color.dart';

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
    return Container(
        height: GetHW.h(280),
        padding: EdgeInsets.only(left: 16),
        // width: GetHW.h(242),
        child: FutureBuilder(
          future: loadAssets(),
          builder: (context, AsyncSnapshot<ProgramsModel> snapshot) {
            if (!snapshot.hasData) {
              return Container( height: GetHW.h(280),
                  width: GetHW.h(242),
                  child: Center(child: const CircularProgressIndicator()));
            } else {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.items.length,
                  itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      // height: GetHW.h(280),
                      width: GetHW.h(242),
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[BoxShadow(color: MyColor.boxshowclr, blurRadius: GetHW.h(8), offset: const Offset(0.75, 0.00),)],
                          borderRadius: BorderRadius.circular(GetHW.h(8)),
                          border: Border.all(color: MyColor.grayboxbg, width: 1, style: BorderStyle.solid,)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/ex2.png"),
                          SizedBox(height: GetHW.h(5),),
                          Padding(
                            padding: EdgeInsets.all(GetHW.h(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subTitle2Text(snapshot.data!.items[index].category, 13, FontWeight.w700, MyColor.blueText),
                                SizedBox(height: GetHW.h(10),),
                                SizedBox(height: GetHW.h(45),
                                    child: subTitle2Text(snapshot.data!.items[index].name, 16,FontWeight.w700,Colors.black, )),
                                SizedBox(height: GetHW.h(20),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    subTitle2Text( "${snapshot.data!.items[index].lesson} lesson",12, FontWeight.w500, MyColor.subTitleTextClr)
                                       ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      );
  }
}
