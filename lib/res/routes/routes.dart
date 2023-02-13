

import 'package:flutter_task_banao/res/routes/routes_name.dart';
import 'package:flutter_task_banao/view/dashboard/dashboard_page.dart';
import 'package:get/get.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.dashboardPage,
      page: () => DashBoardPage() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,

  ];

}