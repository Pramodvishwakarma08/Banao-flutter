import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../model/lessons_for_you_model.dart';
import '../../res/app_layout.dart';
import '../../res/colors/app_color.dart';
class LessonsForYouScreen extends StatefulWidget {
  const LessonsForYouScreen({super.key});

  @override
  State<LessonsForYouScreen> createState() => _LessonsForYouScreenState();
}

class _LessonsForYouScreenState extends State<LessonsForYouScreen> {
  Future<LessonsForYouModel> loadAssets() async {
    LessonsForYouModel lm;
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    lm = LessonsForYouModel.fromJson(jsonresponse);
    print(jsonresponse);
    return lm;
  }

  @override
  void initState() {
    setState(() {
      loadAssets();
    });
    loadAssets();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetHW.h(280),
      padding: EdgeInsets.only(left: GetHW.h(16)),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      child: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<LessonsForYouModel> snapshot) {
            if(!snapshot.hasData){
              return  Container( height: GetHW.h(280),
                  width: GetHW.h(242),
                  child: Center(child: const CircularProgressIndicator()));
            }else{

              return  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(right: GetHW.h(16)),
                      child: Container(
                        // height: GetHW.h(280),
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
                            SizedBox(
                               height: GetHW.h(140),
                                child: Image.asset("assets/ex1.png")),
                            SizedBox(height: GetHW.h(5),),
                            Padding(
                              padding:  EdgeInsets.all(GetHW.h(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.items[index].category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: MyColor.blueText,
                                    ),
                                  ),
                                  SizedBox(height: GetHW.h(10),),

                                  SizedBox(
                                    height: GetHW.h(45),
                                    child: Text(
                                      snapshot.data!.items[index].name,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black,
                                        // height: 1.6
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: GetHW.h(10),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${DateFormat(DateFormat.DAY).format(snapshot.data!.items[index].createdAt)} ${DateFormat(DateFormat.ABBR_MONTH).format(snapshot.data!.items[index].createdAt)}, ${DateFormat(DateFormat.WEEKDAY).format(snapshot.data!.items[index].createdAt)}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: MyColor.subTitleTextClr,
                                        ),
                                      ),
                                      Icon(Icons.lock),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(GetHW.h(14)),
                                      //       border: Border.all(
                                      //         color: MyColor.blueText,
                                      //       )
                                      //   ),
                                      //   child: Padding(
                                      //     padding:  EdgeInsets.symmetric(horizontal: GetHW.h(16),vertical: GetHW.h(6)),
                                      //     child: const Text("Book",
                                      //       style: TextStyle(
                                      //         fontWeight: FontWeight.w600,
                                      //         fontSize: 12,
                                      //         color: MyColor.blueText,
                                      //       ),                      ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Text("${snapshot.data!.![0]}"),
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
