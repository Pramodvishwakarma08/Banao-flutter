import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetHW{

  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  static getScreenHeghit(){
    return Get.height;
  }

  static getScreenWidth(){
    return Get.width;
  }

  static h(double pixels){
    double x =getScreenHeghit()/pixels;
    return getScreenHeghit()/x;

  }

  static w(double pixels){
    double x =getScreenHeghit()/pixels;
    return getScreenWidth()/x;

  }
  
}